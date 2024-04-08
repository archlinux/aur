# Maintainer: Manuel Hüsers <aur@huesers.de>

pkgname=sublime-text-4
pkgver=4.4169
pkgrel=2
pkgdesc='Sophisticated text editor for code, html and prose - stable build'
arch=('x86_64' 'aarch64')
url='https://www.sublimetext.com/download'
license=('custom')
depends=('libpng' 'gtk3')
conflicts=('sublime-text')
provides=('sublime-text')

source=("${pkgname}.sh")
source_x86_64=("${pkgname//-/_}_${pkgver/./_}_${pkgrel}_x64.tar.xz::https://download.sublimetext.com/sublime_text_build_${pkgver:2}_x64.tar.xz")
source_aarch64=("${pkgname//-/_}_${pkgver/./_}_${pkgrel}_arm64.tar.xz::https://download.sublimetext.com/sublime_text_build_${pkgver:2}_arm64.tar.xz")

sha512sums=('ac56e9b7dddaebb3d222795cfc644109c93cc3f79695b8f9ee56022c74fe04a1134dd54cab07c74ff1f96b783cb3dbc026c16095552f1d2dd83115ea274dc2e9')
sha512sums_x86_64=('6764363f8f92f65532d64ba014023e28b18f40dc62a1b114239b59360257d445494f9a2f57580174b5f4994c8fa06cd8f562c9419cfda92324c9ebf25d15e576')
sha512sums_aarch64=('e9964f55a5bff89fc0ad13266cc7695c8e0cc41d86caed212836fd737c3b52d84400c683b3f9699b554e71fa2d3ed3cc4351cfebcf9f182512211227465db3d6')

prepare() {
	sed -i -e "s|@ST_PATH@|/opt/sublime_text|g" "${pkgname}.sh"
	sed -i -e 's#/opt/sublime_text/sublime_text#/usr/bin/subl#g' 'sublime_text/sublime_text.desktop'
	sed -i -e '\#^StartupNotify=#a StartupWMClass=subl' 'sublime_text/sublime_text.desktop'
}

package() {
	install -dm755 "${pkgdir}/opt"
	cp --preserve=mode -r 'sublime_text' "${pkgdir}/opt/sublime_text"
	rm -f "${pkgdir}/opt/sublime_text/sublime_text.desktop"

	for res in 128x128 16x16 256x256 32x32 48x48; do
		install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
		ln -s "/opt/sublime_text/Icon/${res}/sublime-text.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/sublime-text.png"
	done

	install -dm755 "${pkgdir}/usr/share/applications"
	install -Dm644 'sublime_text/sublime_text.desktop' "${pkgdir}/usr/share/applications/sublime_text.desktop"

	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/subl"
}
