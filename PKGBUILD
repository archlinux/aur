# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=km-clay
_gitname=shed
_appname=${_gitname}
pkgname=${_appname}-sh-bin
pkgdesc="A Linux shell with a powerful line editor and IPC socket extensibility"

pkgver=0.41.3
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-linux-musl')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

makedepends=('git')
depends=('glibc' 'libgcc' 'sqlite')

install=shed.install

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
sha256sums=('cbc0c90a4700ae27077e2ee46229f5e1992946e5bff70b8fd5d6252db9218625')
sha256sums_x86_64=('38a9c45959b4b8d9cc0d09cd9274a593dd58b9674fbd54d52e897e5e5664cefb')

case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

BIN_DIR="${_appname}-${pkgver}-${_CARCH}"

prepare() {
	cd "${srcdir}/" || exit

	rm -rf git && git clone -n --depth=1 --filter=tree:0 "${_ghurl}" git && cd git

	git sparse-checkout set --no-cone /examples include/help && git checkout
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${BIN_DIR}/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 git/include/help/*.txt -t "${pkgdir}/usr/share/shed/doc/"

	install -Dm644 git/examples/*.sh -t "${pkgdir}/usr/share/${_appname}/examples/"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${BIN_DIR}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
