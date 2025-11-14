# Maintainer: doclic <doclic@tutanota.com>
# Contributor: Clever Cloud CI <ci@clever-cloud.com>

pkgname=clever-tools
pkgver=4.4.0
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud."
arch=('any')
url="https://github.com/CleverCloud/clever-tools"
license=('Apache-2.0')
makedepends=('nodejs' 'npm')
provides=("clever-tools=${pkgver}")
conflicts=("clever-tools")
options=(!strip)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CleverCloud/clever-tools/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('dfcd2fede06c1210343e39901292111d0c5691e8e63e509b0084ca10b333eafa')

prepare() {
	cd "${srcdir}/clever-tools-${pkgver}"

	npm install
}
build() {
	cd "${srcdir}/clever-tools-${pkgver}"

	node scripts/bundle-cjs.js "${pkgver}" false
	node scripts/build-binary.js "${pkgver}"
}
package() {
	cd "${srcdir}/clever-tools-${pkgver}/build/${pkgver}/linux/clever-tools-${pkgver}_linux"

	install -Dm 755 "clever" "${pkgdir}/usr/bin/clever"
	./clever --bash-autocomplete-script /usr/bin/clever \
		| install -Dm 644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/clever"
	./clever --zsh-autocomplete-script /usr/bin/clever \
		| install -Dm 644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_clever"
}
