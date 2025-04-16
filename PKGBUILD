# Maintainer: Antonio Cervone <ant.cervone@gmail.com>
# Contributor: Gabriel Chamon Araujo <gchamon@live.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Graziano Giuliani <graziano.giuliani@poste.it>

pkgname=magics++
Pkgname=Magics
pkgver=4.16.0
_attnum=3473464
pkgrel=1
pkgdesc="Magics is the latest generation of the ECMWF's Meteorological plotting software MAGICS."
arch=('i686' 'x86_64')
url="https://confluence.ecmwf.int/display/MAGP"
license=('Apache')
depends=('eccodes>=2.19.0' libgeotiff qt6-base pango python)
optdepends=(ksh libaec odb_api)
makedepends=(cmake gcc-fortran python-jinja swig)
source=(http://confluence.ecmwf.int/download/attachments/${_attnum}/${Pkgname}-${pkgver}-Source.tar.gz)
sha256sums=('b5cf365e10e43abbb2e0b14db8e8d8db90486031f6c0de24b0b01c17a0197cf5')

prepare() {
  cd "${Pkgname}-${pkgver}-Source"
  # patch --forward --strip=1 --input=$srcdir/minizip.patch
}

build() {
  [ -x /usr/bin/odb ] && has_odb=ON || has_odb=OFF
  # force this for now. Metview does not compile
  has_odb=OFF

  cmake \
    -B build \
    -S "${Pkgname}-${pkgver}-Source" \
    -DCMAKE_SHARED_LINKER_FLAGS="-pthread" \
    -DCMAKE_EXE_LINKER_FLAGS="-pthread" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=production \
    -DCMAKE_INSTALL_DATADIR=/usr/share \
    -DENABLE_METVIEW=ON \
    -DENABLE_GEOTIFF=ON \
    -DGEOTIFF_DIR=/usr \
    -DENABLE_ODB=${has_odb}

  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
}
