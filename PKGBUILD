# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=worldql-server-git
pkgver=r3.cd18230
pkgrel=1
pkgdesc="The spatial message broker and database for real-time multiplayer experiences."
arch=('x86_64')
url="https://github.com/WorldQL/worldql_server"
license=('GPL3')
groups=()
depends=('zeromq')
makedepends=('cargo' 'git')
checkdepends=()
optdepends=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --tags --long 2>/dev/null | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "$srcdir/$pkgname"

	# Use system zeromq
	sed -i 's/, features = \["zmq-vendored"\] //' Cargo.toml

	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$pkgname"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --features zeromq,websocket
}

package() {
	cd "$srcdir/$pkgname"

	find target/release \
		-maxdepth 1 \
		-executable \
		-type f \
		-exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
}
