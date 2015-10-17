# Maintainer: Wijnand Modderman-Lenstra <maze@maze.io>
pkgname=trustedqsl
pkgver=2.1.2
pkgrel=1
epoch=
pkgdesc="Logbook of the World"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://lotw.arrl.org/"
license=('custom:ARRL')
depends=(openssl expat zlib wxgtk2.8 curl desktop-file-utils)
makedepends=(openssl expat zlib wxgtk curl cmake)
provides=('tqsllib')
conflicts=('trustedqsl-devel')
replaces=('tqsl')
install=$pkgname.install
source=(http://www.arrl.org/files/file/LoTW%20Instructions/tqsl-${pkgver}.tar.gz
       diff.CMakeLists.txt.apps
       diff.CMakeLists.txt.src
       $pkgname.desktop
       $pkgname.install)
md5sums=('f35cefb979c479fec0f3badce8574db5'
       'bbdec5f6ae2d23bb2c74c84df07d2c70'
       '8f401e02bfdefb486bbbeaba58522486'
       '860b305f9cf6db8cc1c14dc88cef34fc'
       'f7e1e2722c972f3420cfd69492c79073')
sha256sums=('2709525c5113d6feadbcc2a17161793047295356b17a26b78cf7af22753489ba'
       '84eb4f182e90d6996d687952e82c47c2cc7c8fcd95a4290ef7b8c77b4d7b6e4e'
       '0adb97d5a65701465309b8fed0fe8fbc04400d3342102887f05fddf52d985f87'
       'cb638467e305f6f9426a22841dbbb4d656a30f48e4c1c27e87dd82890794c167'
       'f703f8de14eb277dc72cc837086fbd55f5d772049a44200686c8ae76348f6614')

prepare() {
       cd "$srcdir/tqsl-${pkgver}"
       patch -p0 < ../diff.CMakeLists.txt.apps
       patch -p0 < ../diff.CMakeLists.txt.src
}

build() {
	cd "$srcdir/tqsl-$pkgver"
	mkdir -p build
	cd build
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DwxWidgets_CONFIG_EXECUTABLE='/usr/bin/wx-config-2.8' \
		-DwxWidgets_wxrc_EXECUTABLE='/usr/bin/wxrc-2.8' \
		../
	make
}

package() {
	cd "$srcdir/tqsl-$pkgver/build"
	make DESTDIR="$pkgdir/" install

	find "$pkgdir" -name wxstd* -exec rm {} +

	install -D -m644 "../LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

	mkdir -p $pkgdir/usr/share/applications
	install -D -m 644 ../../${pkgname}.desktop $pkgdir/usr/share/applications

	rm -rf $pkgdir/usr/include
}
