# Maintainer: Callum Parsey <neoninteger@protonmail.com>
pkgname=turtl-core-rs
pkgver=0.1.2
pkgrel=1
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
	export TURTL_DB_CONNSTR="postgres://turtl:turtl@localhost:5432/turtl"
	export TURTL_UPLOADS_LOCAL="$PWD/turtl-uploads"

	echo "- Creating PostgreSQL database cluster..."
	mkdir turtl-db turtl-uploads
	initdb -D turtl-db -A trust > /dev/null

	echo "- Starting PostgreSQL server..."
	pg_ctl start -D turtl-db -o '-c unix_socket_directories=/tmp' > /dev/null

	echo "- Creating role/database for Turtl server..."
	psql -q -h /tmp -d postgres -c "CREATE USER turtl WITH PASSWORD 'turtl'"
	psql -q -h /tmp -d postgres -c "CREATE DATABASE turtl"

	echo "- Initializing Turtl server database/upload directory..."
	bash -c "cd /usr/share/webapps/turtl && scripts/init-db.sh" > /dev/null
	bash -c "cd /usr/share/webapps/turtl && node tools/populate-test-data.js" > /dev/null

	echo "- Starting Turtl server..."
	node /usr/share/webapps/turtl/server.js > /dev/null &
	sleep 2

	echo "- Generating core-rs configuration..."
	cd "core-rs-${_commithash}"
	sed '/^  endpoint: /c\  endpoint: "http://localhost"' config.yaml.default > config.yaml

	echo "- Running core-rs tests..."
	make test

	echo "- Shutting down Turtl server..."
	cd ..
	kill %1

	echo "- Shutting down PostgreSQL server..."
	pg_ctl stop -D turtl-db > /dev/null

	echo "- Cleaning up..."
	rm -rf turtl-db turtl-uploads "core-rs-${_commithash}/config.yaml"
}

package() {
	cd "core-rs-${_commithash}"
	install -Dm 755 target/release/libturtl_core.so -t "${pkgdir}/usr/lib"
}
