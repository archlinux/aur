# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=km-clay
_gitname=shed
_appname=${_gitname}
pkgname=${_appname}-sh-bin
pkgdesc="A Linux shell with a powerful line editor and IPC socket extensibility"

pkgver=0.19.5
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

makedepends=('git')
depends=('glibc' 'libgcc')

install=shed.install

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}")
sha256sums=('debf948b28ace15c4b382ef4722fb96a5d8d0e3431e02b83999ea7bcc54bd5dc'
            '63935e295aec98532c3dc36362522aa977e38a5ec53b6d68644d8659a050b98b')
sha256sums_x86_64=('3eaa7a640b030451834e991d028749a3e672cf16ddcadfafa2d7a807ea36d1e5')

prepare() {
	cd "${srcdir}/" || exit

	rm -rf git && git clone -n --depth=1 --filter=tree:0 "${_ghurl}" git && cd git

	git sparse-checkout set --no-cone /examples /doc && git checkout
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 git/doc/*.txt -t "$pkgdir/usr/share/${_appname}/doc/"
	install -Dm644 git/examples/*.sh -t "$pkgdir/usr/share/${_appname}/examples/"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
