# Maintainer: Vincent Bernardoff <vb AT luminar.eu.org>

pkgname=libkcapi
pkgver=1.0.3
pkgrel=1
pkgdesc="Linux Kernel Crypto API User Space Interface Library"
arch=('i686' 'x86_64' 'armv6' 'armv7' 'aarch64')
url="http://www.chronox.de/libkcapi.html"
makedepends=('autoconf' 'automake' 'm4' 'make' 'pkg-config')
license=('MIT')
source=("http://www.chronox.de/$pkgname/$pkgname-$pkgver.tar.xz"
        "http://www.chronox.de/$pkgname/$pkgname-$pkgver.tar.xz.asc"
        "makefile.patch")
sha256sums=("4bf40617d3d0373890f710bb7c9434c2dbca8a4a9f380b6bcc34a4f3614c3f29"
            "SKIP"
            "SKIP")
validpgpkeys=("5F0D446594D2BF6977A9828AF02C639D843B5F11")

build() {
  cd "${pkgname}-${pkgver}"

  msg2 'Building...'
  patch < ../../makefile.patch
  autoreconf -i
  ./configure \
      --prefix=/usr \
      --enable-kcapi-test \
      --enable-kcapi-speed \
      --enable-kcapi-hasher \
      --enable-kcapi-rngapp \
      --enable-kcapi-encapp \
      --enable-kcapi-dgstapp \
      --enable-lib-asym \
      --enable-lib-kpp
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  msg2 'Installing license...'
  for file in COPYING* ; do
      install -Dm 644 $file -t "$pkgdir/usr/share/licenses/$pkgname"
  done

  msg2 'Installing documentation'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
