# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=danpozmanter
_gitname=lite-anvil
_appname=${_gitname}
_execname=(${_appname} ${_appname//lite/nano} ${_appname//lite/note})
pkgname=${_appname}-bin
pkgdesc="Fast, Powerful, Lightweight Editor"

pkgver=2.17.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_execname[@]}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'hicolor-icon-theme')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
sha256sums=('5033ffa6312c26ed35ccaefdaad373168d3db16a6b7052a60194b5e327cc5297'
            '070760e7befa3976f7cde1cecd118cd37a03ce8407bb8ca8aff58b1856daa97a')
sha256sums_x86_64=('73a644ff4c23981256dfec9e8e9b9473a9e67b7ba7b3c5f5c83b5f4660451f20')


case ${CARCH} in
	${arch[0]})
		_CARCH=${_barch[0]}
	;;

	${arch[1]})
		_CARCH=${_barch[1]}
	;;
esac

prepare() {
	cd "${srcdir}/${_appname}-${pkgver}-${_CARCH}/" || exit

	sed -E 's/^(Icon=)com\.([^.]+)\..*/\1\2/; s/_/-/' -i *.desktop
}

package() {
	cd "${srcdir}/${_appname}-${pkgver}-${_CARCH}/" || exit

	install -Dm755 ${_execname[@]} -t "${pkgdir}/usr/bin/"

	install -Dm644 *.desktop -t "${pkgdir}/usr/share/applications/"

	install -Dm644 *.png -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"

	install -dm755 "${pkgdir}/usr/share/${_execname[0]}/"
	cp -rfa data "${pkgdir}/usr/share/${_execname[0]}/"
	ln -sf "/usr/share/${_execname[0]}" "${pkgdir}/usr/share/${_execname[1]}"
	ln -sf "/usr/share/${_execname[0]}" "${pkgdir}/usr/share/${_execname[2]}"

	install -Dm644 ../README-${pkgver}.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 ../LICENSE-${pkgver} "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
