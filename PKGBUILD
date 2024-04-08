# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: marcospb19 <marcospb19@hotmail.com>

pkgname=sublime-text-3
pkgver=3.3211
pkgrel=5
pkgdesc='Sophisticated text editor for code, html and prose (legacy version)'
arch=('x86_64')
url='https://www.sublimetext.com/3'
license=('custom')
depends=('libpng' 'gtk2')
install="${pkgname}.install"
source=("https://download.sublimetext.com/sublime_text_3_build_${pkgver:2}_x64.tar.bz2"
	"${pkgname}.sh")
sha512sums=('a6a068119eff95c5360e9ccbe1d845e7a93e4ad13b3659073752a7bd0e87f4691555820185514875649e677a4e8702e2338f74f5584fc80f69c16b323685d6f1'
            'ac56e9b7dddaebb3d222795cfc644109c93cc3f79695b8f9ee56022c74fe04a1134dd54cab07c74ff1f96b783cb3dbc026c16095552f1d2dd83115ea274dc2e9')

prepare() {
	sed -i -e "s|@ST_PATH@|/opt/sublime_text_3|g" "${pkgname}.sh"

	# Adjust naming in desktop entry
	sed -i -e 's#Sublime Text#Sublime Text 3#g' 'sublime_text_3/sublime_text.desktop'
	sed -i -e 's#sublime-text#sublime-text-3#g' 'sublime_text_3/sublime_text.desktop'
	sed -i -e 's#/opt/sublime_text/sublime_text#/usr/bin/subl3#g' 'sublime_text_3/sublime_text.desktop'
	sed -i -e '\#^StartupNotify=#a StartupWMClass=subl3' 'sublime_text_3/sublime_text.desktop'
}

package() {
	# Install sublime text 3
	install -dm755 "${pkgdir}/opt"
	cp --preserve=mode -r 'sublime_text_3' "${pkgdir}/opt/sublime_text_3"
	rm -f "${pkgdir}/opt/sublime_text_3/sublime_text.desktop"

	# Install icons
	for res in 128x128 16x16 256x256 32x32 48x48; do
		install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
		ln -s "/opt/sublime_text_3/Icon/${res}/sublime-text.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/sublime-text-3.png"
	done

	# Install desktop entry and executable
	install -dm755 "${pkgdir}/usr/share/applications"
	install -Dm644 'sublime_text_3/sublime_text.desktop' "${pkgdir}/usr/share/applications/sublime_text_3.desktop"

	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/subl3"
}
