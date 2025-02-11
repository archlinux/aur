# Maintainer: tblFlip <root@tblflip.de
# Contributor: Dominik Schwaiger <mail@dominik-schwaiger.ch>

pkgname=surrealdb
pkgver=2.2.0
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
	"ec4b624b4261c477a92a4d19711bb3e21dae99e521872e1a7ad7f64d19369fa3"
)

prepare() {
	cd "$pkgname-${pkgver//_/-}" || exit
	rustup toolchain install 1.81.0
	rustup override set 1.81.0
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
