# Contributor: Graziano Giuliani <graziano.giuliani@poste.it>
# Contributor: Antonio Cervone <ant.cervone@gmail.com>

pkgname=metview
pkgver=5.8.1
pkgrel=1
pkgdesc="ECMWF interactive meteorological application"
arch=(i686 x86_64)
url="https://software.ecmwf.int/wiki/display/METV/Metview"
license=('APACHE')
groups=(science)
depends=('magics++>=4.0.0'
         qt5-xmlpatterns
         qt5-svg
         lapack
         snappy
         cgal)
makedepends=(rpcsvc-proto)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(https://software.ecmwf.int/wiki/download/attachments/3964985/Metview-${pkgver}-Source.tar.gz
        rpc.patch
        blas.patch
        gfortran.patch)

noextract=()
sha256sums=('dee81efb6e3127457e47c6722b468e4ff1c27f647ea46f98950d46402bed81f8'
            'abd2f612ca08e9d2a7c288ab0d5512777411f9e6c6077e9b1ac62d4a444345a2'
            'c80aed03a542364af5ff177a49e04052d017f992f9139300249be31466170096'
            '1ecdb36a3c547e1de80544e3511dae1981b41d047d82e13c9651ff30ed26087d')

prepare() {
  cd Metview-${pkgver}-Source
  patch --forward --strip=1 --input=$srcdir/rpc.patch
  patch --forward --strip=1 --input=$srcdir/blas.patch
  patch --forward --strip=1 --input=$srcdir/gofortran.patch
}

build() {
  cd Metview-${pkgver}-Source
  mkdir -p build && cd build
  cmake \
    -Dmagics_DIR=/usr/share/magics/cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=production \
    -DCMAKE_INSTALL_DATADIR=/usr/share \
    -DPYTHON_EXECUTABLE=/usr/bin/python3 \
    ..

  make
}

package()
{
  cd Metview-${pkgver}-Source/build
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
