# Contributor: Graziano Giuliani <graziano.giuliani@poste.it>
# Contributor: Antonio Cervone <ant.cervone@gmail.com>

pkgname=metview
pkgver=5.14.0
pkgrel=1
pkgdesc="ECMWF interactive meteorological application"
arch=(i686 x86_64)
url="https://confluence.ecmwf.int/display/METV/Metview"
license=('APACHE')
groups=(science)
depends=(cgal 'magics++>=4.10.0' qt6-5compat qt6-svg snappy)
makedepends=(boost cmake rpcsvc-proto gcc-fortran)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(https://confluence.ecmwf.int/download/attachments/3964985/Metview-${pkgver}-Source.tar.gz
        rpc.patch
        blas.patch
        gfortran.patch
        string.patch)


noextract=()
sha256sums=('aa3b3046e6c4475dcd02ee38c25cfb9487474aefd58a5a27307c9763c3ec511d'
            'abd2f612ca08e9d2a7c288ab0d5512777411f9e6c6077e9b1ac62d4a444345a2'
            '778fff974ed99e01e82e792ab3c75d0e515a31aaec01a6f81fabc5767c6d957a'
            'a86a2a0c8c7a52c38f2c37d2366d0ff22beabf81723f8c6f9696a1743221c3f0'
            '8e698feb27bb8c23f8db58f03c481d810ae14cbffde3860e33c6b0a6c328dfd4')

prepare() {
  cd Metview-${pkgver}-Source
  # patch --forward --strip=1 --input=$srcdir/rpc.patch
  patch --forward --strip=1 --input=$srcdir/blas.patch
  patch --forward --strip=1 --input=$srcdir/gfortran.patch
  patch --forward --strip=1 --input=$srcdir/string.patch
}

build() {
  cmake \
    -B build \
    -S Metview-${pkgver}-Source \
    -Dmagics_DIR=/usr/share/magics/cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=production \
    -DCMAKE_INSTALL_DATADIR=/usr/share \
    -DPYTHON_EXECUTABLE=/usr/bin/python3 \
    ..

  make -C build
}

package()
{
  make -C build DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
