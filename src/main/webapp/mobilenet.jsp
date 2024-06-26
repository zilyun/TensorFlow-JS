<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <body>
        <script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs"></script>
        <script src="https://cdn.jsdelivr.net/npm/@tensorflow-models/toxicity"></script>

        <!-- Place your code in the script tag below. You can also use an external .js file -->
        <script>
            // The minimum prediction confidence.
            const threshold = 0.9;

            // Load the model. Users optionally pass in a threshold and an array of
            // labels to include.
            toxicity.load(threshold).then(model => {
                const sentences = ['you suck'];

                model.classify(sentences).then(predictions => {
                    // `predictions` is an array of objects, one for each prediction head,
                    // that contains the raw probabilities for each input along with the
                    // final prediction in `match` (either `false` or `true`).
                    // If neither prediction exceeds the threshold, `match` is `null`.

                    console.log(predictions);
                    /*
                    prints:
                    {
                      "label": "identity_attack",
                      "results": [{
                        "probabilities": [0.9659664034843445, 0.03403361141681671],
                        "match": false
                      }]
                    },
                    {
                      "label": "insult",
                      "results": [{
                        "probabilities": [0.08124706149101257, 0.9187529683113098],
                        "match": true
                      }]
                    },
                    ...
                     */
                });
            });
        </script>
    </body>

    </html>