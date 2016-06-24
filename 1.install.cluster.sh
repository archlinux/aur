#!/bin/bash

CONFIG_FILE="$1"


# This script is used to create and start a new cluster as well as start an existing cluster.

# Starts an OpenShift cluster using Docker containers, provisioning a registry, router, initial templates, and a default project.

# Data and config is preserved between restarts with the --use-existing-config flag and --host-data-dir argument.

# A public hostname is specified for the server with the --public-hostname argument.

# A custom routing suffix is specified using the --routing-suffix argument.
# This is to allow dynamic host names to be created for routes.

# This script also adds one user to cluster-admin role.

# You can copy or edit config.sh configuration file. This way you can install more then one cluster. However, only one cluster can run at a time.

# You can run 2.install.certificate.sh to install your server's certificate and private key into cluster.
# Then you will be able to access the web console at https://your-domain:8443/console .


_oc_cluster_up() {

    oc cluster up \
    --use-existing-config \
    --host-data-dir="${ORIGIN_HOME}/openshift.local.etcd" \
    --host-config-dir="${ORIGIN_HOME}/openshift.local.config" \
    --host-volumes-dir="${ORIGIN_HOME}/openshift.local.volumes" \
    --public-hostname="${PUBLIC_HOSTNAME}" \
    --routing-suffix="${ROUTING_SUFFIX}"

}


main() {

    if [ -z "${CONFIG_FILE}" ]; then
        echo "You have to pass configuration file."
        echo "Usage:     install.cluster.sh <path-to-config-file>"
        echo "Example: ./install.cluster.sh ./config.sh"
        exit 1
    fi

    source "0.read.config.sh"
    read_config

    _oc_cluster_up

    oc login -u system:admin

    echo "Adding user ${ADMIN_USERNAME} as cluster-admin."
    oadm policy add-cluster-role-to-user cluster-admin "${ADMIN_USERNAME}"
    echo "open https://${PUBLIC_HOSTNAME}:8443/console"
    echo "User:     ${ADMIN_USERNAME}"
    echo "Password: ${ADMIN_USERNAME}"

}

main
