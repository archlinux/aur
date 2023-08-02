# Maintainer: Manuel Hüsers <aur@huesers.de>

pkgname=sublime-text-4
pkgver=4.4151
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

sha512sums_x86_64=('74e1c11117a0cfedd7b435143d0d36ce1fef058ea9b1008e979b4b91c405c0fc6a0e0490b34db2bea9699371c0f938a1f0e558b4b0dbeb0d452c942d2c07f21d')
sha512sums_aarch64=('2989a66a7e3fc3ac752a50467415428712d5724f62ca188429550e9c546b20e0e77da022877c3c588bf743b950fad1133d5b9c43a4ad5df04e4d2eca93a35050')

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
