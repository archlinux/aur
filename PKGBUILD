# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>
# Previous maintainer: Krzysztof Wloch <wloszekk [at] gmail [dot] com>
# Contributor: Piotr Beling <qwak@w8.pl>
pkgname=bcalc
pkgver=13.01.0
pkgrel=1
pkgdesc='Double-dummy solver for bridge (the card game).'
arch=('i686' 'x86_64')
url='http://www.bcalc.w8.pl'
license=('custom')
depends=('lua>=5.1' 'libcurl-compat')
options=('!strip')
source=("${url}/download/bcalc_linuxpkgdevel_09.tar.gz")
md5sums=('32ebb622ae7ef95626279a0dfc877964')
source_i686=("${url}/download/bcalc${pkgver//./}_linux_i686.tar.gz")
md5sums_i686=('8dbbb3db7261c640cc2704b744621f2b')
source_x86_64=("${url}/download/bcalc${pkgver//./}_linux_x86-64.tar.gz")
md5sums_x86_64=('8d80c342fbda2e2c155fc83954f33cca')

package() {
	cd $srcdir

	install -D -m644 bcalc.desktop $pkgdir/usr/share/applications/bcalc.desktop
	install -D -m644 bcalc.png $pkgdir/usr/share/pixmaps/bcalc.png
	
	install -d $pkgdir/usr/share/locale/pl/LC_MESSAGES/
	install -D -m644 i18n/pl/LC_MESSAGES/* $pkgdir/usr/share/locale/pl/LC_MESSAGES/

        libdir=/var/lib/bcalc
	install -d $pkgdir/$libdir/downloaders
	install -m755 bcalcgui $pkgdir/$libdir/bcalcgui2
	install -m755 bcalconsole $pkgdir/$libdir/bcalconsole
	install -m755 singledummy $pkgdir/$libdir/singledummy
        ln -s /usr/lib/libboost_chrono.so $pkgdir/$libdir/libboost_chrono.so.1.50.0
        ln -s /usr/lib/libboost_system.so $pkgdir/$libdir/libboost_system.so.1.50.0
	ln -s /usr/lib/liblua.so $pkgdir/$libdir/liblua5.1.so.0
	install -D -m644 downloaders/* $pkgdir/$libdir/downloaders

	install -d $pkgdir/usr/bin
        # fix libcurl and boost versions
	echo -e '#!'"/bin/sh\nLD_LIBRARY_PATH=$libdir LD_PRELOAD=libcurl.so.3 $libdir/bcalcgui2\n" > bcalcgui
	chmod +x bcalcgui
	install -m755 bcalcgui $pkgdir/usr/bin/bcalcgui
	echo -e '#!'"/bin/sh\nLD_LIBRARY_PATH=$libdir $libdir/bcalconsole\n" > bcalconsole
	chmod +x bcalconsole
	install -m755 bcalconsole $pkgdir/usr/bin/bcalconsole
	echo -e '#!'"/bin/sh\nLD_LIBRARY_PATH=$libdir $libdir/singledummy\n" > singledummy
	chmod +x singledummy
	install -m755 singledummy $pkgdir/usr/bin/singledummy
}
