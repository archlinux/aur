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
        "vars.mk")
sha256sums=("71c1caf3aeb6245040abb0ee063b574dd6ece6314c60edabbe4299a11df49b68"
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
	export TURTL_DB_CONNSTR="postgres://turtl:turtl@localhost:5432/turtl"
	export TURTL_UPLOADS_LOCAL="$PWD/turtl-uploads"

	log() {
		echo -e "  $(tput setaf 4)$(tput bold)->$(tput sgr0) $(tput bold)$@$(tput sgr0)"
	}

	init_dirs() {
		mkdir turtl-db turtl-uploads
	}

	init_database() {
		log "Initializing PostgreSQL database cluster..."
		initdb -D turtl-db -A trust

		log "Starting PostgreSQL server..."
		pg_ctl start -D turtl-db -o "-c unix_socket_directories=/tmp"
	}

	configure_turtl_server() {
		log "Configuring database for Turtl server..."
		psql -h /tmp -d postgres -c "CREATE USER turtl WITH PASSWORD 'turtl'"
		psql -h /tmp -d postgres -c "CREATE DATABASE turtl"
		bash -c "cd /usr/share/webapps/turtl && scripts/init-db.sh"
		bash -c "cd /usr/share/webapps/turtl && node tools/populate-test-data.js"

		log "Starting Turtl server..."
		node /usr/share/webapps/turtl/server.js &
		sleep 2
	}

	run_tests() {
		log "Running tests..."
		sed '/^  endpoint: /c\  endpoint: ""' config.yaml.default > config.yaml
		make test-st
	}

	stop_turtl_server() {
		log "Stopping Turtl server..."
		kill %1
	}

	stop_database() {
		log "Stopping PostgreSQL server..."
		pg_ctl stop -D turtl-db
	}

	remove_dirs() {
		log "Cleaning up..."
		rm -rf turtl-db turtl-uploads config.yaml
	}

	init_dirs

	trap "remove_dirs" ERR
	init_database
	trap - ERR

	trap "stop_database && remove_dirs" ERR
	configure_turtl_server
	trap - ERR

	trap "stop_turtl_server && stop_database && remove_dirs" ERR
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
