# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor=Eoin-McMahon
pkgname=blindfold
pkgver=1.1.0
pkgrel=1
pkgdesc="Gitignore file generator"

arch=('x86_64')
license=('MIT')
url="https://github.com/${pkgauthor}/${pkgname}"

provides=("${pkgname}")

makedepends=('cargo')
depends=('glibc' 'libgcc' 'openssl')

options=('!lto')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b3d515cf57e1925bd027be4431d856708c808a2288023b9019008b1afb0d8730')

prepare() {
	cd "${pkgname}-${pkgver}" || exit

	cargo fetch --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${pkgname}-${pkgver}" || exit

	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "${pkgname}-${pkgver}" || exit

	export CARGO_TARGET_DIR=target
	cargo test --frozen --release
}

package() {
	cd "${pkgname}-${pkgver}" || exit

	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
