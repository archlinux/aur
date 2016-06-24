#!/bin/bash

CONFIG_FILE="$1"


# Start local Docker cluster


main() {

    if [ -z "${CONFIG_FILE}" ]; then
        echo "You have to pass configuration file."
        echo "Usage:     3.start.cluster.sh <path-to-config-file>"
        echo "Example: ./3.start.cluster.sh ./config.sh"
        exit 1
    fi

    # The same script can be used to install the cluster from scratch as well as start an existing cluster that has been stopped.
    ./1.install.cluster.sh $CONFIG_FILE

}

main
