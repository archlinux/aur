# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: fdiblen <fdiblen at gmail dot com>
pkgname=casacore
pkgver=3.5.0
pkgrel=3
pkgdesc="Suite of C++ libraries for radio astronomy data processing"
arch=(x86_64)
url="https://github.com/${pkgname}/${pkgname}"
license=(GPL)
depends=(boost-libs fftw gsl cfitsio wcslib python-numpy)
makedepends=(cmake gcc-fortran gsl boost)
optdepends=('sofa: only for testing casacore measures'
  'hdf5: for the HDF5 C++ bindings')
provides=(
  'libcasa_casa.so=6-64'
  'libcasa_coordinates.so=6-64'
  'libcasa_derivedmscal.so=6-64'
  'libcasa_fits.so=6-64'
  'libcasa_images.so=6-64'
  'libcasa_lattices.so=6-64'
  'libcasa_meas.so=6-64'
  'libcasa_measures.so=6-64'
  'libcasa_mirlib.so=6-64'
  'libcasa_msfits.so=6-64'
  'libcasa_ms.so=6-64'
  'libcasa_python3.so=6-64'
  'libcasa_scimath_f.so=6-64'
  'libcasa_scimath.so=6-64'
  'libcasa_tables.so=6-64')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
  gcc-13-compatility.patch::${url}/pull/1309.patch)
sha512sums=('5ec72450dc60b833864416850e08a4a0903f02b9917e0218aafcef15475dedce88318ea526f44e27b214acad14d31542fed7ea2462d6b9590d178c1085466db4'
  '3f764c8d01c4f9e2a7cec65fe33367d003e49bc31f3e777ab4e5821541dcf3b89ecacc7178800455b1b212e168dc9655d52ac8d3747cb9afa3b634ed0a896710')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i ../gcc-13-compatility.patch
}

build() {
  export CXXFLAGS="${CFLAGS}"
  cmake \
    -S ${pkgname}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DBUILD_PYTHON=OFF \
    -DBUILD_PYTHON3=ON \
    -Wno-dev
  cmake --build build --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${pkgname}-${pkgver}/COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
