# Maintainer: Manuel Hüsers <aur@huesers.de>

pkgname=sublime-text-4
pkgver=4.4152
pkgrel=2
pkgdesc='Sophisticated text editor for code, html and prose - stable build'
arch=('x86_64' 'aarch64')
url='https://www.sublimetext.com/download'
license=('custom')
depends=('libpng' 'gtk3')
conflicts=('sublime-text')
provides=('sublime-text')

source_x86_64=("${pkgname//-/_}_${pkgver/./_}_${pkgrel}_x64.tar.xz::https://download.sublimetext.com/sublime_text_build_${pkgver:2}_x64.tar.xz")
source_aarch64=("${pkgname//-/_}_${pkgver/./_}_${pkgrel}_arm64.tar.xz::https://download.sublimetext.com/sublime_text_build_${pkgver:2}_arm64.tar.xz")

sha512sums_x86_64=('447a3219841150e22c66b45c8a6d0415e1b309512764060f4310c7f685c93a5b4cba2dd7f202ced01f2a3d910c30784bbf5bbb85bae915296845005a69b0bdf4')
sha512sums_aarch64=('dd206f4b174db0809fa80a0e1eef33ffdd59d15d951be91a5438bd2b7774bc2bf8e81521c0e48d54e712d909d9f5d6a485fd3e3de0eb9fa83546a322123864e7')

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
