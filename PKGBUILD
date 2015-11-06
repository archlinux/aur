# Maintainer: Wijnand Modderman-Lenstra <maze@maze.io>
pkgname=trustedqsl
pkgver=2.1.3
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
md5sums=('93199c62e03df79d582c120637e32ac0'
         'a429cf5e00e9994d8b95c09f6869bcb9'
         '1b263b868f52b3f349532d1ee506a3b2'
         '860b305f9cf6db8cc1c14dc88cef34fc'
         'f7e1e2722c972f3420cfd69492c79073')
sha256sums=('188437fdb37eb966336abbfaa0e33d83488567504e8fc87589eca7bbf7b84472'
            'a3f1d9ba39a37564aaf6fd63c1573570cb54b9d97f0701f99245c67c9161c045'
            '81a13ee158839349e3372d7c9ec25dea62029e37709bab71f0e5283bd7569ff4'
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
