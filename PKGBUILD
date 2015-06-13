# Maintainer: Denis Kasak <dkasak|AT|termina.org.uk>
# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>

pkgname=qtstalker
pkgver=0.36
pkgrel=2
pkgdesc="Stock market, commodity and technical analysis charting application"
depends=('qt3>=3.3' 'db>=4.1' 'ta-lib>=0.3.0')
url='http://qtstalker.sourceforge.net/'
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz" qtstalker.desktop)
arch=('i686' 'x86_64')
license=('gpl')
options=('docs')
md5sums=('599589c4e84e828bd888fce6be81dab3'
         'ef3ab3f9d43440b10aa59515d5368cf9')

build() {
    #. /etc/profile.d/qt3.sh
    export QTDIR=/usr/lib/qt3
    export QT_XFT=true
    export PATH=$QTDIR/bin:$PATH
    export PKG_CONFIG_PATH=/opt/qt/lib/pkgconfig:$PKG_CONFIG_PATH
		    
    cd $srcdir/$pkgname-$pkgver

    #path patch:
    grep -rl '/usr/local' * | xargs sed -i -e "s:/usr/local:/usr:g"

    #gcc 4.3 no 'system' patch:
    sed -i -e '36a#include <stdlib.h>\n' lib/UpgradeMessage.cpp
    sed -i -e '45a#include <stdlib.h>\n' src/IndicatorPage.cpp
    sed -i -e '20a#include <unistd.h>\n' lib/ExScript.h

    sed -i -e '2s|-o|"INCLUDEPATH += /usr/include/qt3/" \-o|' configure

    ./configure
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver

    make install INSTALL_ROOT=$pkgdir
    install -D -m 644 -o root -g root pics/qtstalker.xpm $pkgdir/usr/share/pixmaps/qtstalker.xpm
    install -D -m 644 -o root -g root ../qtstalker.desktop $pkgdir/usr/share/applications/qtstalker.desktop
}

