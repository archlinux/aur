# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=km-clay
_gitname=shed
_appname=${_gitname}
pkgname=${_appname}-sh-bin
pkgdesc="A Linux shell with a powerful line editor and IPC socket extensibility"

pkgver=0.29.0
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
sha256sums=('e7c6df7e4e0de0f78da1ce890164f924118e4ffb64505a90ac7727d1b626a3c5')
sha256sums_x86_64=('1be085ecf29297fb572bf174f8ddabcd354360eb48b39a4ccf45a7b04279aa17')

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
