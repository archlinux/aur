# Maintainer: Tomasz Zok <tomasz.zok /at/ gmail.com>
pkgname=rdock
pkgver=2013.1
pkgrel=1
pkgdesc="A Fast, Versatile and Open Source Program for Docking Ligands to Proteins and Nucleic Acids"
arch=(i686 x86_64)
url="http://rdock.sourceforge.net/"
license=('LGPL3')
depends=(popt cppunit)
makedepends=(gcc make)
source=($pkgname-$pkgver.patch
        "https://sourceforge.net/projects/$pkgname/files/latest/download")
md5sums=('71808cfd856d1b87b1b12c38562e3c93'
         '26bf3bd445ddaf6059236fcc44262be0')

prepare() {
    cd "$srcdir/rDock_${pkgver}_src"
    patch -p0 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
    cd "$srcdir/rDock_${pkgver}_src/build"
    if [[ $CARCH == i686 ]]; then
        _target=linux-g++
    else
        _target=linux-g++-64
    fi
    make $_target
}

package() {
    mkdir -p $pkgdir/{opt/$pkgname,etc/profile.d}
    echo "export RBT_ROOT=/opt/$pkgname" > $pkgdir/etc/profile.d/rdock.sh
    echo "export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:\$RBT_ROOT/lib" >> $pkgdir/etc/profile.d/rdock.sh
    echo "export PATH=\$PATH:\$RBT_ROOT/bin" >> $pkgdir/etc/profile.d/rdock.sh
    mv $srcdir/rDock_${pkgver}_src/* $pkgdir/opt/$pkgname/
}
