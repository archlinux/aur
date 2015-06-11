# Maintainer: zaps166 <spaz16@wp.pl>

pkgname=kydpdict
pkgver=0.9.5
pkgrel=4
pkgdesc="A front-end to YDP Collins Dictionary"
arch=('i686' 'x86_64')
url="http://fossies.org/linux/privat/kydpdict-0.9.5.tar.gz/kydpdict-0.9.5/contrib/kydpdict.pl.1"
license=('GPL')
depends=('qt3')
install=kydpdict.install
source=(http://fossies.org/linux/privat/$pkgname-$pkgver.tar.bz2 $pkgname.png $pkgname.desktop)
md5sums=('4da97f41c63666f3d9e151a18c0ef65e'
         'dee4f28a7c681292226d06ab97b39e3e'
         'e42aed4dde1a7f203586220d04737237')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}

    tar zxf contrib/kydpdict-0.9.3-oxpwnsnd.tar.gz
    patch -Np1 -i kydpdict-0.9.3-oxpwnsnd/kydpdict-0.9.3-pwnoxsnd.patch

    ./configure --prefix=/usr --with-qt-dir=/usr/lib/qt3 --with-qt-includes=/usr/include/qt3
    sed 's/QT_LIB=-lqt-mt/QT_LIB=-lqt-mt -lz/' src/Makefile > Makefile_new
    mv Makefile_new src/Makefile
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver

    make DESTDIR="$pkgdir" install

    install -D -m 644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
    install -D -m 644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
    install -D -m 644 contrib/$pkgname.1 $pkgdir/usr/share/man/man1/$pkgname.1
    install -D -m 644 contrib/$pkgname.pl.1 $pkgdir/usr/share/man/pl/man1/$pkgname.1

    gcc -O2 -Wall kydpdict-0.9.3-oxpwnsnd/exwaves.c -o $pkgdir/usr/bin/exwaves
}
