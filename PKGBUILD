# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=tareqmy
_gitname=gitwig
_appname=${_gitname}
_alias=gtg
pkgname=${_appname}-bin
pkgdesc="A rust based tui an alternative to sourcetree"

pkgver=2.5.13
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-musl')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}" "${_alias}")
conflicts=("${_appname}")

makedepends=('git')
depends=('git' 'openssh')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
sha256sums=('8dcf88576d0444711b6bd95a3de612f5ef9390b16e81a55708c687435ef48e39'
            '218c40f12f8eb9be0e6cdf365bbbf3e4c0fded5319e1bbff631f747336188e43')
sha256sums_x86_64=('304f6c6cc5420371890c4a5be552400166d0e2677b2db692a628d9460ba36c7f')


prepare() {
	cd "${srcdir}/" || exit

	rm -rf git && git clone -n --depth=1 --filter=tree:0 --branch "${_gitversion}" "${_ghurl}" git && cd git

	git sparse-checkout set --no-cone /docs && git checkout
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"
	ln -sf "/usr/bin/${_appname}" "${pkgdir}/usr/bin/${_alias}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	for doc in git/docs/*.md; do
		install -Dm644 "${doc}" "${pkgdir}/usr/share/doc/${pkgname}/$(name=$(basename "${doc}" .md); echo "${name^^}.md")"
	done

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
