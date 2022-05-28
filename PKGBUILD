# Maintainer: Vincent Bernardoff <vb AT luminar.eu.org>

pkgname=libkcapi
pkgver=1.4.0
pkgrel=1
pkgdesc="Linux Kernel Crypto API User Space Interface Library"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="http://www.chronox.de/libkcapi.html"
makedepends=('autoconf' 'automake' 'm4' 'make' 'pkg-config')
license=('BSD' 'GPL2')
source=("http://www.chronox.de/$pkgname/$pkgname-$pkgver.tar.xz"
        "http://www.chronox.de/$pkgname/$pkgname-$pkgver.tar.xz.asc"
        "makefile.patch")
sha256sums=('644b47593b3f27f08add7a8808ccdbe569a2f331d70fb8b52551e57379b917fa'
            'SKIP'
            '792424adf0c33ec1902a0cde15e9ca8ee7b19c9952b07b3b799fad5662d3b551')

validpgpkeys=("3BCC43D4D2C87D1784B69EE4421EE936326AC15B")

build() {
  cd "${pkgname}-${pkgver}"
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
  for file in COPYING* ; do
      install -Dm 644 $file -t "$pkgdir/usr/share/licenses/$pkgname"
  done
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  make DESTDIR="$pkgdir" install
}
