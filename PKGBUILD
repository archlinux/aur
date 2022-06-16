# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Previous Maintainer: Wijnand Modderman-Lenstra <maze@maze.io>
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=trustedqsl
__pkgname=tqsl
pkgver=2.6.3
pkgrel=1
pkgdesc="QSO log signing data for the ARRL Logbook of The World (LoTW)"
arch=('i686' 'x86_64' 'aarch64')
url="http://lotw.arrl.org/"
license=('custom:ARRL')
depends=('lmdb' 'wxgtk3' 'hamradio-menus')
makedepends=('cmake' 'libxxf86vm')
provides=('tqsllib' 'trustedqsl')
conflicts=('trustedqsl-git')
replaces=('tqsl')
source=(http://www.arrl.org/$__pkgname/$__pkgname-$pkgver.tar.gz
	$pkgname.desktop)

build() {
	cd "$srcdir/${__pkgname}-$pkgver"

	mkdir -p build
	cd build
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DwxWidgets_CONFIG_EXECUTABLE='/usr/bin/wx-config-gtk3' \
		-DwxWidgets_wxrc_EXECUTABLE='/usr/bin/wxrc-3.0' \
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
md5sums=('52dfc67bc2e8946cb71214dbbbb47f95'
         '6dd4296f5fda2d77922c9cbe4a120d3b')
sha256sums=('7ef7b2d9bb252e90408c97d730e9ba6bf02c81e7a343d5450f94c6af0c41cdbb'
            '68129b7f7ddbb75be52f1b9164d43c6d9805c5877423546b50397c2d920c79e9')
