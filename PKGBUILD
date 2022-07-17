# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Mike Sampson <mike at sambodata dot com>
# Contributor: Bernhard Walle <bernhard.walle@gmx.de>

pkgname=libafterimage
pkgver=1.20
pkgrel=6
pkgdesc="Generic image manipulation library"
url="http://www.afterstep.org/afterimage"
license=('GPL')
depends=('librsvg')
arch=('x86_64')
source=("https://downloads.sourceforge.net/project/afterstep/libAfterImage/$pkgver/libAfterImage-$pkgver.tar.bz2"
        libafterimage-libpng15.patch
        libafterimage-ldflags.patch
        header-install.patch)
sha256sums=('6e233253f4d1dd22dfce9f9a245cc036d814fc99ba7f6732f4e345de62cfe458'
            'bbf95bcddc4c48dcde88745dc9cb772ca53b625e8e466b9d565e4183ce71dbe3'
            'a38f2e46bb69f6749c5e48cff60f51fae6bda19d268f0c7f16dfbd74d34d2f64'
            '6e1c5fd8acbbbc1c83f0ca490f08b7602d37a2295cb4741eef6f3b88fb638203')

prepare() {
  cd libAfterImage-$pkgver

  # Fix header installation (FS#60246)
  patch -p1 -i ../header-install.patch

  # Apply Gentoo's libpng15 patch
  patch < ../libafterimage-libpng15.patch

  # Make sure LDFLAGS are passed to lib
  patch < ../libafterimage-ldflags.patch
}

build() {
  cd libAfterImage-$pkgver

  CPPFLAGS="${CPPFLAGS}" \
  CFLAGS="${CFLAGS}" \
  CXXFLAGS="${CXXFLAGS}" \
  LDFLAGS="${LDFLAGS}" \
  ./configure --prefix=/usr --mandir=/usr/share/man \
              --enable-sharedlibs --disable-staticlibs

  # don't run ldconfig
  sed -i -e 's/`uname`/"hack"/g' Makefile

  make AR="ar cq"
}

package() {
  cd libAfterImage-$pkgver
  make DESTDIR="$pkgdir" install
}

# :mode=shellscript:
