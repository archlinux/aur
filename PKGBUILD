# Maintainer: tblFlip <root@tblflip.de
# Contributor: Dominik Schwaiger <mail@dominik-schwaiger.ch>

pkgname=surrealdb
pkgver=2.0.0
pkgrel=1
pkgdesc="A scalable, distributed, collaborative, document-graph database, for the realtime web"
arch=('x86_64')
url="https://github.com/surrealdb/surrealdb"
license=('custom:BSL')
depends=("gcc-libs")
makedepends=("rustup" "cargo-make" "clang" "patch")
checkdepends=("rustup" "cargo-make" "clang" "patch")
conflicts=("surrealdb-bin")

source=(
	"https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver//_/-}/LICENSE"
	"${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${pkgver//_/-}.tar.gz"
)

sha256sums=(
	"dd98c688e54be8b85ad79e603f5112449b9789dfc031db94eb5c7dc843702aef"
	"a201c060d89e475560a2d410c09856b8b9cb2bb6d01be1d8e17ed171cc6fff4a"
)

prepare() {
	rustup toolchain install 1.80
	rustup override set 1.80
}

build() {
	cd "$pkgname-${pkgver//_/-}" || exit
	cargo make build
}

check() {
	cd "$pkgname-${pkgver//_/-}" || exit
	# We dont need cargo-fmt here...
	#cargo make check
	cargo make cargo-check
	cargo make cargo-clippy
}

package() {
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "$pkgname-${pkgver//_/-}" || exit
	install -Dm755 target/make/surreal "$pkgdir/usr/bin/surreal"
}
