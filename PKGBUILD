# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=rmichaelthomas
_gitname=liminate
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A prose-as-syntax language designed from the human end"

pkgver=0.18.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

makedepends=('git')
depends=('glibc' 'zlib')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[0]}")
sha256sums=('531f1280c7e6064170e49c4ae1ef0ea32b55e046bcdf7f0434cb701d31c79e8b'
            'c3f9257c3c8dbbcdf6945799136c5f806d72bc890bb4bde61fd7ce5d88c38c77')
sha256sums_x86_64=('6ab01f2747355e7d1401f9c1b380345038a8f57db5ceba5bbdf8693289ebb6a5')


prepare() {
	cd "${srcdir}/" || exit

	rm -rf git && git clone -n --depth=1 --filter=tree:0 "${_ghurl}" git && cd git

	git sparse-checkout set --no-cone /examples && git checkout
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -dm755 "${pkgdir}/usr/share/${_appname}/examples"
	cp -rf "git/examples/"* "${pkgdir}/usr/share/${_appname}/examples/"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
