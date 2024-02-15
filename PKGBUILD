# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgbase=libonvif
pkgname=('libonvif' 'onvif-gui')
pkgver=1.4.4
pkgrel=1
url='https://github.com/sr99622/libonvif'
arch=('i686' 'x86_64')
makedepends=('cmake' 'git' 'libavcodec.so' 'libavdevice.so' 'libavformat.so' 'libavutil.so'
             'libswresample.so' 'libswscale.so' 'libxkbcommon-x11' 'libxml2' 'python' 'qt5-base' 'sdl2')
source=("git+${url}.git#commit=ab5ccb2635a18552a9b10102531b7d61dbc55868"
        "${pkgbase}.desktop")
sha256sums=('SKIP'
            'dc6d193827628215ccf66c0617c6ce2150e2fc3a5ee66afc35fb9c0c7d571d88')

build() {
	cd ${srcdir}/${pkgbase}
	cmake -B build \
		-D CMAKE_BUILD_TYPE=Release \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D BUILD_GUI=ON
	cmake --build build
	DESTDIR="${srcdir}/${pkgbase}/destdir" cmake --install build
}

package_libonvif() {
	pkgdesc='A client side implementation of the ONVIF specification - library and CLI app'
	license=('BSD-2-Clause-NETBSD' 'GPL-2.0-or-later')
	depends=('libxml2')

	cp -R ${srcdir}/${pkgbase}/destdir/. ${pkgdir}
	rm -f \
		${pkgdir}/usr/bin/onvif-gui \
		${pkgdir}/usr/lib/libavio.* \
		${pkgdir}/usr/share/man/*/onvif-gui.*
}

package_onvif-gui() {
	pkgdesc='A client side implementation of the ONVIF specification - GUI app'
	license=('Apache-2.0' 'GPL-2.0-or-later')
	depends=('libavcodec.so' 'libavformat.so' 'libavutil.so' 'libswresample.so'
	         'libswscale.so' 'libonvif' 'libxkbcommon-x11' 'qt5-base' 'sdl2')

	cp -R ${srcdir}/${pkgbase}/destdir/. ${pkgdir}
	rm -f -R \
		${pkgdir}/usr/bin/onvif-util \
		${pkgdir}/usr/include \
		${pkgdir}/usr/lib/libonvif.* \
		${pkgdir}/usr/share/man/*/onvif-util.*
	install -D -m 644 \
		${srcdir}/${pkgbase}.desktop \
		${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -D -m 644 \
		${srcdir}/${pkgbase}/${pkgname}/resources/${pkgname}.png \
		${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png
}
