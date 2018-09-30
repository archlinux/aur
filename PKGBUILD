# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Mike Sampson <mike at sambodata dot com>
# Contributor: Bernhard Walle <bernhard.walle@gmx.de>

pkgname=libafterimage
pkgver=1.20
pkgrel=3
pkgdesc="Generic image manipulation library"
url="http://www.afterstep.org/afterimage"
license=('GPL')
depends=('librsvg')
arch=('x86_64')
source=("https://downloads.sourceforge.net/project/afterstep/libAfterImage/$pkgver/libAfterImage-$pkgver.tar.bz2"
        libafterimage-libpng15.patch
        header-install.patch)
md5sums=('17a0ab8a2e6b253f222934418705963e'
         'bdb49e626cb91b2c218193f3d36c9f91'
         'c4f8b94d9a7dda3e3e55420747b1b5ca')

prepare() {
  cd libAfterImage-$pkgver

  # Fix header installation (FS#60246)
  patch -p1 -i ../header-install.patch

  # Apply Gentoo's libpng15 patch
  patch < ../libafterimage-libpng15.patch
}

build() {
  cd libAfterImage-$pkgver

  ./configure --prefix=/usr --mandir=/usr/share/man \
              --enable-sharedlibs --disable-staticlibs

  # don't run ldconfig
  sed -i -e 's/`uname`/"hack"/g' Makefile

  make
}

package() {
  cd libAfterImage-$pkgver
  make DESTDIR="$pkgdir" install
}

# :mode=shellscript:
