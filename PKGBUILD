# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Previous Maintainer: Wijnand Modderman-Lenstra <maze@maze.io>
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=trustedqsl
__pkgname=tqsl
pkgver=2.5.8
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

	rm -rf $pkgdir/usr/include $pkgdir/man5
}
md5sums=('cbc349f5d269d656fa500302bc674489'
         'fb4f5e8437982d20f70d6641e36ea141'
         '2440ccac773ce945ed416be3451c3dd8'
         '860b305f9cf6db8cc1c14dc88cef34fc')
sha256sums=('d66d9d75d9beba3903af9000b02f4de6e6e52f6a5e010174338ac4ca81b84d68'
            '9a92ce3d79c511a51bde9468020459dcc67f029e3390d267032583a43d924ca5'
            '16d9c2ddcfe62e0872dd0367eb2defcbc4a894adb2065a654c854168dc239ec8'
            'cb638467e305f6f9426a22841dbbb4d656a30f48e4c1c27e87dd82890794c167')
