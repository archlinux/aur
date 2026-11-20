# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=versenilvis
_gitname=IRIS
_appname=${_gitname,,}
pkgname=${_appname}-autocomplete-bin
pkgdesc="Shell auto-completion tool that works like code editors IntelliSense."

pkgver=0.8.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('0BSD')

depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
        "LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}.tar.gz")
sha256sums=('c68c96d5eb1b0f4b27f17c6b1f432794badf8ac04e4d43f8ba5d1bd08e4a8313'
            '0db3336be1d50c18d8d0f844a996cdddaf66a018dbdee58ab94933c1c6ffc2e9')
sha256sums_x86_64=('e05b2cf6d71f306672bfbe85bfab1993d43a8bfca6c6822e52560567cf10fb34')
sha256sums_aarch64=('a238401d598b2798e6892390239cd70aa899bda8e564db6de6f8c5076ba53bdb')


build() {
	cd "${srcdir}/" || exit

	mkdir -p completions
	./"${_appname}" completion zsh > "completions/${_appname}.zsh"
	./"${_appname}" completion bash > "completions/${_appname}.bash"
	./"${_appname}" completion fish > "completions/${_appname}.fish"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" -t "${pkgdir}/usr/bin"

	install -Dm644 "completions/${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -Dm644 "completions/${_appname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"
	install -Dm644 "completions/${_appname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
