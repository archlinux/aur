# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=RudySource
_gitname=Dirgo
_appname=dgo
pkgname=${_gitname,,}-bin
pkgdesc="Fast, local-first directory navigation"

pkgver=0.6.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0' 'MIT')

provides=("${_appname}")
depends=('glibc' 'libgcc')
conflicts=("${pkgname%-bin}")

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
sha256sums_x86_64=('b797a14a8d045ef93883335081afbd001be6f56dbf9c7a2f219c0e3469420b1a')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

build() {
	cd "${srcdir}/${_gitname,,}-${_gitversion}-${_CARCH}/" || exit

	mkdir -p "./completions"

	"./${_appname}" completions zsh > "./completions/${_appname}.zsh"
	"./${_appname}" completions bash > "./completions/${_appname}.bash"
	"./${_appname}" completions fish > "./completions/${_appname}.fish"
}

package() {
	cd "${srcdir}/${_gitname,,}-${_gitversion}-${_CARCH}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "completions/${_appname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"
	install -Dm644 "completions/${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -Dm644 "completions/${_appname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
