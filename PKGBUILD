# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=versenilvis
_gitname=IRIS
_appname=${_gitname,,}
pkgname=${_appname}-autocomplete-bin
pkgdesc="Shell auto-completion tool that works like code editors IntelliSense."

pkgver=0.7.0
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
sha256sums=('693b9e6728565a7ebd8d38ff387affb94daad07733a4c9b3ab87e71e7b951864'
            '0db3336be1d50c18d8d0f844a996cdddaf66a018dbdee58ab94933c1c6ffc2e9')
sha256sums_x86_64=('19cb128a4be12c8ed4792480c10bfd1c61a732df328e6d52c14147b3b83e6813')
sha256sums_aarch64=('36629540423e25200ffd2cec1dc991069576289e2583c9874f4f311c61dc2e53')


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
