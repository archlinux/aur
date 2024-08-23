# Maintainer: tblFlip <root@tblflip.de
# Contributor: Dominik Schwaiger <mail@dominik-schwaiger.ch>

pkgname=surrealdb
pkgver=1.5.4
pkgrel=2
pkgdesc="A scalable, distributed, collaborative, document-graph database, for the realtime web"
arch=('x86_64')
url="https://github.com/surrealdb/surrealdb"
license=('custom:BSL')
depends=('curl' 'clang')
makedepends=('rustup' 'cargo-make')
checkdepends=('rustup' 'cargo-make')
conflicts=('surrealdb-bin')

source=(
	"https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver//_/-}/LICENSE"
	"${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${pkgver//_/-}.tar.gz"
)

sha256sums=(
	"a007c53f27d30bda8cc56feec356eba13b646a8fb59a97d151e3aab820429d2d"
	"7962dd8288e8ff6885356047249a56e10ed0aaf32abe6deb1ee99a0655c322ed"
)

prepare() {
	rustup toolchain install 1.77
	rustup override set 1.77
}

build() {
	cd "$pkgname-${pkgver//_/-}" || exit
	cargo make build
}

check() {
	cd "$pkgname-${pkgver//_/-}" || exit
	cargo make check
}

package() {
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "$pkgname-${pkgver//_/-}" || exit
	install -Dm755 target/release/surreal "$pkgdir/usr/bin/surreal"
}
