# Maintainer: Callum Parsey <neoninteger@protonmail.com>
pkgname=turtl-core-rs
pkgver=0.1.2
pkgrel=5
pkgdesc="Turtl's logic core, built in Rust"
arch=("i686" "x86_64")
url="https://github.com/turtl/core-rs"
license=("GPL3")
depends=("libsodium" "openssl-1.0")
makedepends=("rust")
checkdepends=("turtl-server")

# Note: Turtl core-rs is versioned but not with Git tags or releases, the only
# way to download a specific core-rs version is using a commit hash that
# contains modifications to the CHANGELOG.md file.
_commithash="774fa361d021d9ef5237d32d09515ab7b2a32ad2"

source=("https://github.com/turtl/core-rs/archive/${_commithash}.tar.gz"
        "config-client.yaml"
        "config-server.yaml"
        "rusqlite.patch"
        "url.patch")
sha256sums=("71c1caf3aeb6245040abb0ee063b574dd6ece6314c60edabbe4299a11df49b68"
            "31791752feae4d5b0a19272bbb15df827bf67bb9df237e45431dc4b15b212c2e"
            "f3c974201d4d7b8bc00e51595cb0738d3772fd3bbd73624abc32536838465308"
            "bbe83ed13302a40db4589966aad01539c1165327dc74ff999a32350fb3c05e92"
            "a5985c5a5af81e59a6caf8eb4046dc7a4f581b50abe0fce7cffb1b3a07bd0d94")

prepare() {
    # This version of core-rs depends on an old version of rusqlite (v0.13.0)
    # which can't be built on current versions of Rust. This patch updates the
    # version of rusqlite used to v0.14.0, the first release to contain the
    # fix that allows it to compile again.
    patch -Np0 -i rusqlite.patch

    # Same with url - it needs to be updated from v1.6.0 to v1.7.2 in order to
    # fix build issues. For now, I chose not to go with the latest version due
    # to the potential for API-breaking changes that would require actual
    # patching on the core-rs source code. The correct fix would be for me to
    # learn Rust, update all of the dependencies for core-rs and then send that
    # as a pull request to its repository.
    patch -Np0 -i url.patch
}

build() {
    # Note: The OpenSSL binding library used by Turtl depends on OpenSSL v1.0,
    # here we specify variables to ensure that version 1.0 is used for
    # building, rather than v1.1 which is included in Arch-based systems and
    # used by default.
    export OPENSSL_INCLUDE_DIR=/usr/include/openssl-1.0
    export OPENSSL_LIB_DIR=/usr/lib/openssl-1.0

    cd "core-rs-${_commithash}"
    cargo build --features sqlite-static --release
}

check() {
    cd "core-rs-${_commithash}"

    # NOTE: The integration tests need to link to the already-built turtl_core
    # library and used to do so automatically, however this does not work
    # anymore. Upstream bug or deprecated funtionality in Rust?
    # To work around this, we temporarily set LD_PRELOAD_PATH to the directory
    # containing turtl_core.so to allow the dynamic linking to occur.
    export LD_LIBRARY_PATH="${srcdir}/core-rs-${_commithash}/target/release:${LD_LIBRARY_PATH}"

    # Determine the capabilities of the terminal this script is running in
    reset="$(tput sgr0 2> /dev/null)"
    if [ "$?" -eq 0 ]; then
        bold="$(tput bold 2> /dev/null)"

        numColours="$(tput colors)"
        if [ "$numColours" -ge 8 ]; then
            blue="$(tput setaf 4)"
        fi
    fi

    # Echoes a blue arrow followed by a bolded log message, much like the
    # verbose printing that makepkg itself does
    log() {
        echo -e "${reset}  ${bold}${blue}->${reset} ${bold}$@${reset}"
    }

    # Create the directories for the PostgreSQL database cluster, Turtl server
    # copy and Turtl server upload contents. Copy the core-rs and server
    # configuration files, initialize the database cluster and start a
    # PostgreSQL server instance within it.
    init_database() {
        log "Creating directories and copying configuration files..."
        mkdir turtl-db turtl-server turtl-server/config turtl-uploads
        cp ../config-client.yaml config.yaml
        cp ../config-server.yaml turtl-server/config/config.yaml

        log "Initializing PostgreSQL database cluster..."
        initdb -D turtl-db -A trust

        log "Starting PostgreSQL server..."
        pg_ctl start -D turtl-db -o "-c unix_socket_directories=/tmp"
    }

    # Copy the Turtl server executable files into our temporary directory. This
    # allows us to run the server with our own configuration file rather than
    # having to patch a user-controlled configuration. Then create a user and
    # database for the Turtl server to use, populate this database with the
    # test suite data, and finally start running the Turtl server as a
    # background task. Sleep for 2 seconds to ensure the server is up before
    # continuing.
    configure_turtl_server() {
        log "Copying Turtl server files..."
        cd turtl-server
        cp -r /usr/share/webapps/turtl/controllers controllers
        cp -r /usr/share/webapps/turtl/helpers helpers
        cp -r /usr/share/webapps/turtl/models models
        cp -r /usr/share/webapps/turtl/node_modules node_modules
        mkdir plugins
        cp -r /usr/share/webapps/turtl/scripts scripts
        cp -r /usr/share/webapps/turtl/tools tools
        cp /usr/share/webapps/turtl/server.js server.js

        log "Configuring database for Turtl server..."
        psql -h /tmp -d postgres -c "CREATE USER turtl WITH PASSWORD 'turtl'"
        psql -h /tmp -d postgres -c "CREATE DATABASE turtl"
        scripts/init-db.sh
        node tools/populate-test-data.js

        log "Starting Turtl server..."
        node server.js &
        sleep 2
        cd ..
    }

    # Run the cargo test suite for core-rs.
    # Note: The 'migrate' test requires a deprecated Lisp-based Turtl server to
    # be running, in order to test how the client can migrate data from an old
    # server to a new NodeJS-based server. As the Lisp server is not run from
    # this PKGBUILD check() function, the test will fail. To work around this,
    # (at least for now) we just skip the test.
    run_tests() {
        log "Building and running unit tests..."
        cargo test --features sqlite-static --release -- --test-threads 1

        log "Building and running integration tests..."
        cd integration-tests
        cargo test --release -- --skip migrate
        cd ..
    }

    # Send SIGTERM to the Turtl server task to make it quit
    stop_turtl_server() {
        log "Stopping Turtl server..."
        kill %1
    }

    # Shut down the PostgreSQL server. There is a directory change in here just
    # in case the function was called as a result of an error during
    # configure_turtl_server() in which the directory is not the same as what
    # is expected here.
    stop_database() {
        cd "$srcdir/core-rs-${_commithash}"
        log "Stopping PostgreSQL server..."
        pg_ctl stop -D turtl-db
    }

    # Delete the created folders for the Turtl server and database, as they
    # are no longer necessary.
    remove_dirs() {
        log "Cleaning up..."
        rm -rf turtl-db turtl-server turtl-uploads config.yaml
    }

    # The default behaviour in makepkg is that, if a command returns with a
    # non-zero exit status, the script will stop execution and makepkg will
    # exit. This means that if a command such as 'make test-st' fails, the
    # script will exit before the database/Turtl servers have been shut down,
    # meaning they will keep running. By trapping errors like this, it is
    # possible to override makepkg's default behaviour and run the necessary
    # shutdown routines should a command fail. In the below examples, if an
    # error occurs during the configure_turtl_server() step (i.e. the
    # temporary directories and database cluster have been created, and the SQL
    # server is running) the proper shutdown routines are run from the trap to
    # stop the SQL server and clean up the directories.

    trap "remove_dirs" ERR
    init_database
    trap - ERR

    trap "stop_database; remove_dirs" ERR
    configure_turtl_server
    trap - ERR

    trap "stop_turtl_server; stop_database; remove_dirs" ERR
    run_tests
    trap - ERR

    stop_turtl_server
    stop_database
    remove_dirs
}

package() {
    cd "core-rs-${_commithash}"
    install -Dm 755 target/release/libturtl_core.so -t "${pkgdir}/usr/lib"
}
