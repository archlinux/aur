# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Previous Maintainer: Wijnand Modderman-Lenstra <maze@maze.io>
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=trustedqsl
__pkgname=tqsl
pkgver=2.2
pkgrel=1
pkgdesc="QSO log signing data for the ARRL Logbook of The World (LoTW)"
arch=('i686' 'x86_64')
url="http://lotw.arrl.org/"
license=('custom:ARRL')
depends=('wxgtk2.8' 'curl' 'hamradio-menus')
makedepends=('cmake')
provides=('tqsllib')
conflicts=('trustedqsl-git')
replaces=('tqsl')
install=$pkgname.install
source=(http://www.arrl.org/files/file/LoTW%20Instructions/${__pkgname}-${pkgver}.tar.gz
	diff.CMakeLists.txt.apps
	diff.CMakeLists.txt.src
	$pkgname.desktop
	$pkgname.install)

prepare() {
	cd "$srcdir/${__pkgname}-$pkgver"

	patch -p0 < ../diff.CMakeLists.txt.apps
	patch -p0 < ../diff.CMakeLists.txt.src
}

build() {
	cd "$srcdir/${__pkgname}-$pkgver"

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
	cd "$srcdir/${__pkgname}-$pkgver/build"
	make DESTDIR="$pkgdir/" install

	find "$pkgdir" -name wxstd* -exec rm {} +

	install -D -m644 "../LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

	mkdir -p $pkgdir/usr/share/applications
	install -D -m 644 ../../$pkgname.desktop $pkgdir/usr/share/applications

	rm -rf $pkgdir/usr/include
}
md5sums=('c0db316e2a40dc3706fb35314defe046'
         'bbdec5f6ae2d23bb2c74c84df07d2c70'
         '8f401e02bfdefb486bbbeaba58522486'
         '860b305f9cf6db8cc1c14dc88cef34fc'
         'f7e1e2722c972f3420cfd69492c79073')
sha256sums=('2f68a6cbac7c0546d4f9c088d504d933c3fd3681fd4cfbf30b77ad57c4c4ac5a'
            '84eb4f182e90d6996d687952e82c47c2cc7c8fcd95a4290ef7b8c77b4d7b6e4e'
            '0adb97d5a65701465309b8fed0fe8fbc04400d3342102887f05fddf52d985f87'
            'cb638467e305f6f9426a22841dbbb4d656a30f48e4c1c27e87dd82890794c167'
            'f703f8de14eb277dc72cc837086fbd55f5d772049a44200686c8ae76348f6614')
