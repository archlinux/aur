# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=sagiegurari
_gitname=duckscript
_appname=${_gitname%script}
pkgname=${_gitname}-bin
pkgdesc="Simple, extendable and embeddable scripting language."

pkgver=0.11.1
pkgrel=1
_gitversion=${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-musl')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

# source=("README-${pkgver}.md::${_ghurlraw}/README.md"
# 		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.zip::${_ghurl}/releases/download/${_gitversion}/${_gitname}-v${_gitversion}-${_barch[0]}.zip")
sha256sums_x86_64=('8943ab3b6507e62e201578aa4a991dd19a4c583cbaed7173b0599a3501bb214d')


case ${CARCH} in
	${arch[0]})
		_CARCH=${_barch[0]}
	;;
esac

prepare() {
	cd "${srcdir}/${_gitname}-v${_gitversion}-${_CARCH}/" || exit

	rm -rf git && git clone -n --depth=1 --filter=tree:0 "${_ghurl}" git

	cd git && git sparse-checkout set --no-cone /examples && git checkout

	cp -rfa examples ./../ && cd .. && rm -rf git
}

package() {
	cd "${srcdir}/${_gitname}-v${_gitversion}-${_CARCH}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -dm755 "${pkgdir}/usr/share/${_appname}/"
	cp -rfa "examples" "${pkgdir}/usr/share/${_appname}/"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
