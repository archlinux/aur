# Maintainer: Taras Shpot <mrshpot at gmail dot com>

pkgname=wine-libusb-git
pkgver=3.fb101f5
pkgrel=1
pkgdesc="libusb for Wine"
arch=("i686" "x86_64")
license=('LGPLv2')
url="https://github.com/stanson-ch/libusb-wine"
depends=('wine')
makedepends=('wine')
provides=('wine-libusb')
source=("git+https://github.com/stanson-ch/libusb-wine.git")
md5sums=('SKIP')

pkgver() {
    cd $srcdir/libusb-wine
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
     cd $srcdir/libusb-wine
     cp -r src src-32bit
     
     cd $srcdir/libusb-wine/src
     make clean
     make
     
     cd $srcdir/libusb-wine/src-32bit
     sed -i -e 's/CC = gcc/CC = gcc -m32/' Makefile
     sed -i -e 's/WINEGCC = winegcc/WINEGCC = winegcc -m32/' Makefile
     sed -i -e 's/WINEBUILD = winebuild/WINEBUILD = winebuild -m32/' Makefile
     sed -i -e 's#/usr/lib/#/usr/lib32/#g;' Makefile
     make clean
     make
}

package() {
     mkdir -p $pkgdir/usr/lib/wine/fakedlls
     mkdir -p $pkgdir/usr/lib32/wine/fakedlls
     
     cd $srcdir/libusb-wine/src
     make install DESTDIR=$pkgdir

     cd $srcdir/libusb-wine/src-32bit
     make install DESTDIR=$pkgdir
}
