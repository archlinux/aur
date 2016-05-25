# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>
# Previous maintainer: Krzysztof Wloch <wloszekk [at] gmail [dot] com>
# Contributor: Piotr Beling <qwak@w8.pl>

# Note: only x86_64 is supported.  The PKGBUILD for version 13.01.0 is the
# latest that supports i686.
pkgname=bcalc
pkgver=16.05.0
pkgrel=1
pkgdesc='Double-dummy solver for bridge (the card game).'
arch=('i686' 'x86_64')
url='http://www.bcalc.w8.pl'
license=('custom')
depends=('lua52' 'qt5-base')
options=('!strip')
source=("${url}/download/bcalc_linuxpkgdevel_09.tar.gz"
        "${url}/download/bcalc${pkgver//./}_linux_x86-64.tar.gz")
md5sums=('32ebb622ae7ef95626279a0dfc877964'
         '457c79f739811c06d291707b8f14bf4f')

package() {
    cd $srcdir

    install -D -m644 bcalc.desktop $pkgdir/usr/share/applications/bcalc.desktop
    install -D -m644 bcalc.png $pkgdir/usr/share/pixmaps/bcalc.png

    install -d $pkgdir/usr/share/locale/pl/LC_MESSAGES/
    install -D -m644 i18n/pl/LC_MESSAGES/* $pkgdir/usr/share/locale/pl/LC_MESSAGES/

    libdir=/opt/bcalc
    install -d $pkgdir/$libdir/downloaders
    install -D -m644 downloaders/* $pkgdir/$libdir/downloaders
    install -m755 bcalcqtgui $pkgdir/$libdir/bcalcgui
    install -m755 bcalconsole $pkgdir/$libdir/bcalconsole
    install -m755 bdeal $pkgdir/$libdir/bdeal
    ln -s /usr/lib/liblua5.2.so $pkgdir/$libdir/liblua5.2.so.0

    install -d $pkgdir/usr/bin

    # bcalc links against liblua5.2.so.0 instead of liblua5.2.so
    echo -e '#!'"/bin/sh\nLD_LIBRARY_PATH=$libdir $libdir/bcalcgui\n" > bcalcgui
    chmod +x bcalcgui
    install -m755 bcalcgui $pkgdir/usr/bin/bcalcgui
    echo -e '#!'"/bin/sh\nLD_LIBRARY_PATH=$libdir $libdir/bcalconsole\n" > bcalconsole
    chmod +x bcalconsole
    install -m755 bcalconsole $pkgdir/usr/bin/bcalconsole
    echo -e '#!'"/bin/sh\nLD_LIBRARY_PATH=$libdir $libdir/bdeal\n" > bdeal
    chmod +x bdeal
    install -m755 bdeal $pkgdir/usr/bin/bdeal
}
