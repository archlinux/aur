# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=DanielCardonaRojas
_gitname=codemark
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A semantic code bookmarking system for humans and agents"

pkgver=0.8.0
pkgrel=1
_gitversion=${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}" "${_appname}-tui")
conflicts=("${pkgname%%-bin}")
depends=('bash' 'zlib')

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.txz::${_ghurl}/releases/download/${_gitversion}/${_appname}-cli-${_barch[0]}.tar.xz")
sha256sums_x86_64=('87cb431e8668515bd6eaf0760635d8e95e68405465189bc841ac7ab7a800377e')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

build() {
	cd "${srcdir}/${_appname}-cli-${_CARCH}/" || exit

	mkdir -p completions
	./"${_appname}" completions zsh > "completions/${_appname}.zsh"
	./"${_appname}" completions bash > "completions/${_appname}.bash"
	./"${_appname}" completions fish > "completions/${_appname}.fish"
}

package() {
	cd "${srcdir}/${_appname}-cli-${_CARCH}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_appname}-tui" <<EOF
#!/usr/bin/sh

exec /usr/bin/${_appname} tui "\$@"
EOF

	install -Dm644 "completions/${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -Dm644 "completions/${_appname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"
	install -Dm644 "completions/${_appname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
