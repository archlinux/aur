# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=rmichaelthomas
_gitname=liminate
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A prose-as-syntax language designed from the human end"

pkgver=0.14.1
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
sha256sums=('80f562ed3437c87628b3cd5306d01c1fea59e16e7e5024fcbc8f8436b1586a94'
            'c3f9257c3c8dbbcdf6945799136c5f806d72bc890bb4bde61fd7ce5d88c38c77')
sha256sums_x86_64=('316269ad75eff6435e9084f5abfdd6867bf08bfe8a8e628f810c983e33fbd3f9')


prepare() {
	cd "${srcdir}/" || exit

	rm -rf git && git clone -n --depth=1 --filter=tree:0 "${_ghurl}" git && cd git

	git sparse-checkout set --no-cone /examples && git checkout
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -dm755 "${pkgdir}/usr/share/${_pkgname}/examples"
	cp -rf "git/examples/"* "${pkgdir}/usr/share/${_pkgname}/examples/"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
