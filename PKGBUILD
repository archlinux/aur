# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=bilalyazicioglu
_gitname=tincan-cli
_appname=${_gitname%-cli}
pkgname=${_appname}-bin
pkgdesc="Peer-to-peer voice and text chat for the terminal"

pkgver=0.3.2
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
sha256sums=('fdc3fd1ea4d3a23876b0bc2c819651ba8a96a9bac768e3b7b7b7e4b60e0744ec'
            'd8fd0feeb37abd725f571dfa751fa76f1003ec9b89ef67f480ff48e2c8535d48')
sha256sums_x86_64=('0b86620454e565f4a7bcf4eb8670455d7eccaaf0fddead2a96d709bad0a0d5ba')
sha256sums_aarch64=('a81233885d8bae9d5a8c588ff803d4fec4fb689b301f651c6297dfdc4486542c')


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
