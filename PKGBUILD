# Maintainer: tblFlip <root@tblflip.de
# Contributor: Dominik Schwaiger <mail@dominik-schwaiger.ch>

pkgname=surrealdb
pkgver=2.1.3
pkgrel=1
pkgdesc="A scalable, distributed, collaborative, document-graph database, for the realtime web"
arch=('x86_64')
url="https://github.com/surrealdb/surrealdb"
license=("BUSL-1.1")
depends=("gcc-libs" "glibc")
makedepends=("rustup" "cargo-make" "clang" "patch" "git")
checkdepends=("rustup" "cargo-make" "clang" "patch" "git")
provides=("surrealdb")
conflicts=("surrealdb-bin")

source=(
	"https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver//_/-}/LICENSE"
	"${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${pkgver//_/-}.tar.gz"
)

sha256sums=(
	"dd98c688e54be8b85ad79e603f5112449b9789dfc031db94eb5c7dc843702aef"
	"7046f8c46b500988d729fff212d0e009244675fd6e766096cf311382489ac42b"
)

prepare() {
	cd "$pkgname-${pkgver//_/-}" || exit
	rustup toolchain install 1.80.1
	rustup override set 1.80.1
	rustup target add "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-${pkgver//_/-}" || exit

	# Now for some hilarious reason, rquickjs is really picky about lto in some situations.
	# It also doesnt quite help that rustc blankly reports that as E0463.
	export CFLAGS="${CFLAGS//-flto=[^ ]*/ }"
	export CXXFLAGS="${CXXFLAGS//-flto=[^ ]*/ }"
	export LDFLAGS="${LDFLAGS//-flto=[^]*/ }"

	cargo build --release --locked --target "$CARCH-unknown-linux-gnu"
}

package() {
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "$pkgname-${pkgver//_/-}" || exit
	install -Dm755 "target/$CARCH-unknown-linux-gnu/release/surreal" "$pkgdir/usr/bin/surreal"
}
