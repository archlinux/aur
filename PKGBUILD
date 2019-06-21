# Maintainer: Callum Parsey <neoninteger@protonmail.com>
pkgname=turtl-core-rs
pkgver=0.1.2
pkgrel=2
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
        "vars.mk")
sha256sums=("71c1caf3aeb6245040abb0ee063b574dd6ece6314c60edabbe4299a11df49b68"
            "f5400e9c80c935915212e818f05eab8d3d542a54ed89e153c20a6c0fa00d8e1a"
            "ef42f08759af7ce12a06ba168877e74835e1bcdc2c4dca3aea9435b5983961e2"
            "8dd67ffa28f833baa88c57ecabcc0c5e020d53b5a5516034478a0883be29193d")

prepare() {
	cp vars.mk "core-rs-${_commithash}"
}

build() {
	cd "core-rs-${_commithash}"
	make release
}

check() {
	cd "core-rs-${_commithash}"

	# Echoes a blue arrow followed by a bolded log message, much like the
	# verbose printing that makepkg itself does
	log() {
		echo -e "  $(tput setaf 4)$(tput bold)->$(tput sgr0) $(tput bold)$@$(tput sgr0)"
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

	# Run the cargo test suite for core-rs
	run_tests() {
		log "Running tests..."
		make test-st
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
