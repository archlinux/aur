# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini@gmail.com>

_pkgauthor=sigoden
_pkgname=argc
pkgname=${_pkgname}-bin
pkgver=1.24.0
pkgrel=1
pkgdesc="An elegant command-line argument parser"

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"

arch=('x86_64' 'i686' 'aarch64')
license=('MIT' 'Apache-2.0')

provides=("${_pkgname}")
conflicts=("${pkgname%-bin}")

depends=('curl' 'tar' 'gzip' 'unzip')
makedepends=('help2man')

source=("README_${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-MIT_${pkgver}::${_urlraw}/LICENSE-MIT"
        "LICENSE-APACHE_${pkgver}::${_urlraw}/LICENSE-APACHE")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[0]}-unknown-linux-musl.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[0]}-unknown-linux-musl.tar.gz")

sha256sums=('1c89461c092e7a24758aa6e62ab5cdc605f61926109a54f24f99698ea68179d0'
            '5af431a6a9869052e2be4e71ccd731c7efe45dca47eaca84d4d1fb38f134cb79'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('92e2c30ef078e0a66855b5bdd389cefa7ac6ef4c1fe0b177f3f0bf639891aa72')
sha256sums_i686=('92e2c30ef078e0a66855b5bdd389cefa7ac6ef4c1fe0b177f3f0bf639891aa72')
sha256sums_aarch64=('92e2c30ef078e0a66855b5bdd389cefa7ac6ef4c1fe0b177f3f0bf639891aa72')


prepare() {
	cd "${srcdir}/" || exit

	mkdir -p completions
}

build() {
	cd "${srcdir}/" || exit

	local compgen="${_pkgname} --argc-completions"
	${compgen} zsh  > "completions/${_pkgname}.zsh"
	${compgen} bash > "completions/${_pkgname}.bash"
	${compgen} fish > "completions/${_pkgname}.fish"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "completions/${_pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
	install -Dm644 "completions/${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
	install -Dm644 "completions/${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"

	install -Dm644 "README_${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-MIT_${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE_${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
