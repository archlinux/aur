# Contributor: Graziano Giuliani <graziano.giuliani@poste.it>
# Contributor: Antonio Cervone <ant.cervone@gmail.com>

pkgname=metview
pkgver=5.11.0
pkgrel=1
pkgdesc="ECMWF interactive meteorological application"
arch=(i686 x86_64)
url="https://software.ecmwf.int/wiki/display/METV/Metview"
license=('APACHE')
groups=(science)
depends=(cgal lapack 'magics++>=4.5.0' qt5-svg qt5-xmlpatterns snappy)
makedepends=(boost cmake rpcsvc-proto gcc-fortran)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(https://software.ecmwf.int/wiki/download/attachments/3964985/Metview-${pkgver}-Source.tar.gz
        rpc.patch
        blas.patch
        gfortran.patch
        string.patch)

noextract=()
sha256sums=('766e3dd36e17bdb32624ea2bdbaa8e5e77cdb25c44ff5dee5a1544e55c9c1476'
            'abd2f612ca08e9d2a7c288ab0d5512777411f9e6c6077e9b1ac62d4a444345a2'
            'c80aed03a542364af5ff177a49e04052d017f992f9139300249be31466170096'
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
