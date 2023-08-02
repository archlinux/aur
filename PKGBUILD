# Maintainer: Manuel Hüsers <aur@huesers.de>

pkgname=sublime-text-4
pkgver=4.4152
pkgrel=1
pkgdesc='Sophisticated text editor for code, html and prose - stable build'
arch=('x86_64' 'aarch64')
url='https://www.sublimetext.com/download'
license=('custom')
depends=('libpng' 'gtk3')
conflicts=('sublime-text')
provides=('sublime-text')

source_x86_64=("https://download.sublimetext.com/sublime_text_build_${pkgver:2}_x64.tar.xz")
source_aarch64=("https://download.sublimetext.com/sublime_text_build_${pkgver:2}_arm64.tar.xz")

sha512sums_x86_64=('8ed3d7ed4a5e235bda670cea1b24d3d9511a47368dced0dbd44e802fcc250f9b33b3562014553bed0ac61daf6ce0871409a5f655aa013c1f09a007b7721f4a37')
sha512sums_aarch64=('2e696e3abfdf6b6d897b65565e0ecbd05a425a7048eb1f89cede350aca65048498a64b5b688e1227c4bd0ee697c1a7f5ea7fbba3538de070577f4f348fa02c8a')

package() {
	cd "${srcdir}"

	install -dm755 "${pkgdir}/opt"
	cp --preserve=mode -r 'sublime_text' "${pkgdir}/opt/sublime_text"
	rm -f "${pkgdir}/opt/sublime_text/sublime_text.desktop"

	for res in 128x128 16x16 256x256 32x32 48x48; do
		install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
		ln -s "/opt/sublime_text/Icon/${res}/sublime-text.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/sublime-text.png"
	done

	sed -i 's#/opt/sublime_text/sublime_text#/usr/bin/subl#g' 'sublime_text/sublime_text.desktop'
	sed -i '\#^StartupNotify=#a StartupWMClass=subl' 'sublime_text/sublime_text.desktop'

	install -dm755 "${pkgdir}/usr/share/applications"
	install -Dm644 'sublime_text/sublime_text.desktop' "${pkgdir}/usr/share/applications/sublime_text.desktop"

	install -dm755 "${pkgdir}/usr/bin"
	ln -s '/opt/sublime_text/sublime_text' "${pkgdir}/usr/bin/subl"
}
