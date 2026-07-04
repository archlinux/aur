# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=rmichaelthomas
_gitname=liminate
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A prose-as-syntax language designed from the human end"

pkgver=0.15.1
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
sha256sums=('a5d8c323dea8654773780ac773f839c7b6ed1d1aa6a07222ff3e1a32d0abbddc'
            'c3f9257c3c8dbbcdf6945799136c5f806d72bc890bb4bde61fd7ce5d88c38c77')
sha256sums_x86_64=('7d504a29a9512e290ce3e8406ef415f615cd5ef428f4c331813600ac9c7c4361')


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
