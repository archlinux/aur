# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=atpija
_gitname=octo
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Remote Code Execution Platform"

pkgver=0.2.1
pkgrel=1
_gitversion=${pkgver}

arch=('x86_64')
_barch=('amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT' 'Apache-2.0')

provides=("${_appname}")
conflicts=("${_appname}")

makedepends=('patool')
depends=('glibc' 'zlib')

options=(!strip)
noextract=("${_appname}-"{server,runner,client}"-${arch[0]}-${pkgver}.deb")

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_ghurl}/releases/download/${_gitversion}/${_gitname}-"{server,runner,client}"_${_gitversion}_${_barch[0]}.deb")
sha256sums=('a846b9995a265ee190767414ae447ddea4fe0a57acec60a745b45b01fa931c4d'
            '3c2a7239e8036e845b87621548b26a0ebe6ccf3a002739bea60a167e392ec2e4')
sha256sums_x86_64=('7ed5125aab121bdbae5fd69c9beae3b9accb8c85240fa2027d1216b760701773'
                   'e6c262a3446ab71a5488a2f8a551386855dd078d54e6da90f27e203c7dd68824'
                   '3821a15234fe7956f7e40271429cf005f0ec13bb802838a191d07d196a8d2519')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

prepare() {
	cd "${srcdir}/" || exit

	patool extract *.deb
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "octo-"{server,runner,client}"_${pkgver}_${_CARCH}/usr/local/bin/"* -t "${pkgdir}/usr/bin/"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
