# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=bilalyazicioglu
_gitname=tincan-cli
_appname=${_gitname%-cli}
pkgname=${_appname}-bin
pkgdesc="Peer-to-peer voice and text chat for the terminal"

pkgver=0.4.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'alsa-lib')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('28a8a1fd0e8f0921866c175cb7f4b8f7b67364d8ed625b531852261a8485ae80'
            'd8fd0feeb37abd725f571dfa751fa76f1003ec9b89ef67f480ff48e2c8535d48')
sha256sums_x86_64=('7eeba50bd0aedb9461436c40e5e306916e6a4e092f9ceb34eb91649aad3c8049')
sha256sums_aarch64=('473cf91c8e7df643d929c054bd00e1509ed6d3b1f89a18c32929ce9cd7675ac8')


build() {
	cd "${srcdir}/" || exit

	mkdir -p completions

	./"${_appname}" completions zsh > "completions/${_appname}.zsh"
	./"${_appname}" completions bash > "completions/${_appname}.bash"
	./"${_appname}" completions fish > "completions/${_appname}.fish"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "completions/${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -Dm644 "completions/${_appname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"
	install -Dm644 "completions/${_appname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
