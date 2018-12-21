# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Previous Maintainer: Wijnand Modderman-Lenstra <maze@maze.io>
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=trustedqsl
__pkgname=tqsl
pkgver=2.4.3
pkgrel=1
pkgdesc="QSO log signing data for the ARRL Logbook of The World (LoTW)"
arch=('i686' 'x86_64')
url="http://lotw.arrl.org/"
license=('custom:ARRL')
depends=('lmdb' 'wxgtk2.8' 'curl' 'hamradio-menus')
makedepends=('cmake' 'libxxf86vm')
provides=('tqsllib' 'trustedqsl')
conflicts=('trustedqsl-git')
replaces=('tqsl')
source=(http://www.arrl.org/files/file/LoTW%20Instructions/${__pkgname}-${pkgver}.tar.gz
	diff.CMakeLists.txt.apps
	diff.CMakeLists.txt.src
	$pkgname.desktop)

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
md5sums=('8ccab252c46d7a8fa7269c54eade0525'
         'bbdec5f6ae2d23bb2c74c84df07d2c70'
         '2440ccac773ce945ed416be3451c3dd8'
         '860b305f9cf6db8cc1c14dc88cef34fc')
sha256sums=('e94fe337fd5442c35a494b4be378b9f5e508939a56cd92a5aca0836b79511739'
            '84eb4f182e90d6996d687952e82c47c2cc7c8fcd95a4290ef7b8c77b4d7b6e4e'
            '16d9c2ddcfe62e0872dd0367eb2defcbc4a894adb2065a654c854168dc239ec8'
            'cb638467e305f6f9426a22841dbbb4d656a30f48e4c1c27e87dd82890794c167')
