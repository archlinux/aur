# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Chris <christopher.r.mullins g-mail>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Thiago Franco de Moraes <totonixsame@gmail.com>

pkgname=gdcm
pkgver=3.0.24
pkgrel=1
pkgdesc="C++ library for DICOM medical files"
arch=(x86_64)
url="https://github.com/malaterre/GDCM"
license=(BSD)
depends=(glibc gcc-libs openjpeg2)
makedepends=(cmake python swig)
optdepends=('python: python bindings')
provides=(libgdcmMEXD.so libgdcmDSED.so libgdcmMSFF.so)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/malaterre/GDCM/archive/v${pkgver}.tar.gz")
sha512sums=('2fe28444cee171a536d63f26c1ad7308a03b946e79dc8b7d648b5c7e6f4a8f52c0c32ec9cf463d95b876db31becc81541638b97fc7f15b79ae04de5988d6941e')

build() {
  pysitepackages=$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')
  echo $pysitepackages

  cmake -B build -S "GDCM-${pkgver}" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DGDCM_BUILD_APPLICATIONS:BOOL=ON \
    -DGDCM_BUILD_SHARED_LIBS:BOOL=ON \
    -DGDCM_BUILD_TESTING:BOOL=OFF \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DGDCM_BUILD_DOCBOOK_MANPAGES:BOOL=OFF \
    -DGDCM_USE_SYSTEM_OPENJPEG:BOOL=ON \
    -DGDCM_USE_VTK:BOOL=OFF \
    -DGDCM_WRAP_PYTHON:BOOL=ON \
    -DGDCM_INSTALL_PYTHONMODULE_DIR:STRING="$pysitepackages"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "GDCM-${pkgver}/Copyright.txt" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
