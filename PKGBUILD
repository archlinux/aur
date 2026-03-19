# Maintainer: doclic <doclic@tutanota.com>
# Contributor: Clever Cloud CI <ci@clever-cloud.com>

pkgname=clever-tools
pkgver=4.7.1
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
sha256sums=('61f495935574d9be33b9e134a3b7d659f183cc810aa5cf2349a5b3d3c0532c7e')

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
