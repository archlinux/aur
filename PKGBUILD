# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=libsigrok4dsl-git
pkgver=0.98.r9.gb31f432
pkgrel=1
pkgdesc='A library which provides the basic API for DreamSourceLab hardware'
url='https://github.com/DreamSourceLab/DSView'
arch=(i686 x86_64)
license=(GPL3)
depends=(libzip libusb libserialport)
makedepends=(git)
source=(git://github.com/DreamSourceLab/DSView.git) #branch=develop
sha1sums=('SKIP')

pkgver() {
  cd DSView
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd DSView/libsigrok4DSL
  sed 's|/usr/local/|/usr/|' -i libsigrok.h
  ./autogen.sh

  # remove rpath
  sed 's| -Wl,--rpath=/usr/local/lib||' -i configure.ac
  autoconf
}

build() {
  cd DSView/libsigrok4DSL
  ./configure --prefix=/usr
  make
}

package() {
  cd DSView/libsigrok4DSL
  make install DESTDIR="$pkgdir"
}
