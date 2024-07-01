# Maintainer: doclic <doclic@tutanota.com>
# Contributor: Clever Cloud CI <ci@clever-cloud.com>

pkgname=clever-tools
pkgver=3.8.0
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud."
arch=('any')
url="https://github.com/CleverCloud/clever-tools"
license=('Apache-2.0')
makedepends=('nodejs' 'npm')
provides=("clever-tools-bin=${pkgver}")
conflicts=("clever-tools-bin")
options=(!strip)
source=("https://github.com/CleverCloud/clever-tools/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('94f1af526d6344140760c7162de7f5e20389ac0e83d952c5b8f136d0e4f26fc5')

prepare() {
	cd "${srcdir}/clever-tools-${pkgver}"

	# Only build for Linux, we don't care about the Windows or OSX builds
	sed -i \
		-e "s/\(const[[:space:]]\+archList[[:space:]]*=[[:space:]]*\)\[[^]]*\]/\1['linux']/" \
		scripts/config.js
	npm install
}
build() {
	cd "${srcdir}/clever-tools-${pkgver}"

	node scripts/job-build.js "${pkgver}"
}
package() {
	cd "${srcdir}/clever-tools-${pkgver}/build/${pkgver}/bin/clever-tools-${pkgver}_linux"

	install -Dm 755 "clever" "${pkgdir}/usr/bin/clever"
	./clever --bash-autocomplete-script /usr/bin/clever \
		| install -Dm 644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/clever"
	./clever --zsh-autocomplete-script /usr/bin/clever \
		| install -Dm 644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_clever"
}
