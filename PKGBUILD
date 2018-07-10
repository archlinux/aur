# Maintainer: Vincent Bernardoff <vb AT luminar.eu.org>

pkgname=libkcapi
pkgver=1.1.1
pkgrel=1
pkgdesc="Linux Kernel Crypto API User Space Interface Library"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="http://www.chronox.de/libkcapi.html"
makedepends=('autoconf' 'automake' 'm4' 'make' 'pkg-config')
license=('BSD' 'GPL2')
source=("http://www.chronox.de/$pkgname/$pkgname-$pkgver.tar.xz"
        "http://www.chronox.de/$pkgname/$pkgname-$pkgver.tar.xz.asc"
        "makefile.patch")
sha256sums=("a6cb952a7151184f6e74180e2624f7016f3bfe1fdf88535e9f3380af9864e03a"
            "SKIP"
            "SKIP")
validpgpkeys=("3BCC43D4D2C87D1784B69EE4421EE936326AC15B")

build() {
  cd "${pkgname}-${pkgver}"

  msg2 'Building...'
  patch < ../makefile.patch
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
