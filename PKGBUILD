# Maintainer: Chan Beom Park <cbpark@gmail.com>

pkgname=softsusy
pkgver=4.1.12
pkgrel=1
pkgdesc="This program provides a SUSY spectrum in the NMSSM, or the MSSM including flavour violation and with or without R-parity consistent with input Standard Model fermion mass/mixings and electroweak/strong coupling data."
arch=("x86_64")
url="http://softsusy.hepforge.org"
license=('GPL')
makedepends=("autoconf")
depends=("gcc-libs" "gcc-fortran")
source=("http://www.hepforge.org/archive/softsusy/${pkgname}-${pkgver}.tar.gz"
        "remove_duplicate_header.patch"
        "remove_install_data_local.patch")
sha256sums=('2a5980e80f4346fa511c62050fb2321322090a5e2852766e250af563676f7185'
            '363e0537caf14b340d1d1308f768e314f0b14a90455c4ba4eaa2fd41884c369b'
            '5a58edaa0a73a594d7f9758135f0ce10e7cb01c2d6f2a1b08b37237fc5b12263')

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -p1 -i "${srcdir}/remove_duplicate_header.patch"
  patch -p1 -i "${srcdir}/remove_install_data_local.patch"
  autoreconf -i
}

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr \
              --enable-shared=yes \
              --enable-static=no
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
