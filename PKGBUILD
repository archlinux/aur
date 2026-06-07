# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=km-clay
_gitname=shed
_appname=${_gitname}
pkgname=${_appname}-sh-bin
pkgdesc="A Linux shell with a powerful line editor and IPC socket extensibility"

pkgver=0.26.2
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
sha256sums=('df31130893847f2264b5a20ef796dc33cb52bca006211c77d97267d7193d940d')
sha256sums_x86_64=('ac2de04ea52aa68d47ad547cea71bea2fb41477277f0b4c9a0dccad09fbc5602')

case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

BIN_DIR="${_appname}-${pkgver}-${_CARCH}"

prepare() {
	cd "${srcdir}/" || exit

	rm -rf git && git clone -n --depth=1 --filter=tree:0 "${_ghurl}" git && cd git

	git sparse-checkout set --no-cone /examples && git checkout
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${BIN_DIR}/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 git/examples/*.sh -t "$pkgdir/usr/share/${_appname}/examples/"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${BIN_DIR}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
