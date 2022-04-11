# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=capsimage
pkgver=5.1
pkgrel=2
pkgdesc="Library to access IPF and CTR files"
arch=('x86_64')
url="https://www.kryoflux.com/"
license=('custom:SPS License')
depends=('gcc-libs')
provides=('libcapsimage.so=5-64')
source=("https://www.kryoflux.com/download/spsdeclib_${pkgver}_source.zip"
        'ipflib42_linux-x86_64.tar.gz::http://www.softpres.org/_media/files:ipflib42_linux-x86_64.tar.gz')
sha256sums=('e60b756fa68c5fe073a28c618a0ec06220ef185e2a3c59e4a8d001c930f693d1'
            'ea139673e29a36dc3be7ba916628b5c8a03353bd68be4d346daed803d472ddf3')

prepare() {
	bsdtar -xf capsimg_source_linux_macosx.zip
}

build() {
	cd capsimg_source_linux_macosx/CAPSImg
	chmod +x configure
	./configure --prefix=/usr
	make
}

package() {
	cd capsimg_source_linux_macosx/CAPSImg
	# some applications expect the object files in /usr/lib/caps ...
	install -Dm644 "libcapsimage.so.5.1" "${pkgdir}/usr/lib/caps/libcapsimage.so"
	ln -s "libcapsimage.so" "${pkgdir}/usr/lib/caps/libcapsimage.so.5"
	ln -s "libcapsimage.so" "${pkgdir}/usr/lib/caps/libcapsimage.so.5.1"
	# ... but some others in /usr/lib
	ln -s "caps/libcapsimage.so" "${pkgdir}/usr/lib/libcapsimage.so"
	ln -s "caps/libcapsimage.so" "${pkgdir}/usr/lib/libcapsimage.so.5"
	ln -s "caps/libcapsimage.so" "${pkgdir}/usr/lib/libcapsimage.so.5.1"

	install -Dm644 "../Core/CommonTypes.h" "${pkgdir}/usr/include/caps/CommonTypes.h"
	cp ../LibIPF/*.h "${pkgdir}/usr/include/caps/"

	# some header files from 4.2 for compatibilty
	cp --no-preserve=mode ${srcdir}/x86_64-linux-gnu-capsimage/include/caps/*.h "${pkgdir}/usr/include/caps/"
}
