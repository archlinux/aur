# Maintainer: Chan Beom Park <cbpark@gmail.com>

pkgname=softsusy
pkgver=4.1.7
pkgrel=1
pkgdesc="This program provides a SUSY spectrum in the NMSSM, or the MSSM including flavour violation and with or without R-parity consistent with input Standard Model fermion mass/mixings and electroweak/strong coupling data."
arch=("x86_64")
url="http://softsusy.hepforge.org"
license=('GPL')
makedepends=("autoconf")
depends=("gcc-libs" "gcc-fortran")
source=("http://www.hepforge.org/archive/softsusy/${pkgname}-${pkgver}.tar.gz"
        "remove_duplicate_header.patch")
sha256sums=('5ff7890e5be9f0affa89016bf6bcaed032700c09e6ea278a6e7fd5d6d4ccb12c'
            '75923858486bc404f2147b11cb7691410b83be624ca9b2c6607e9dfee98f1353')

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -p1 -i "${srcdir}/remove_duplicate_header.patch"
  autoreconf -i
}

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr \
              --enable-shared=yes \
              --enable-static=no
  MAKEFLAGS=-j1 make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
