# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Chris <christopher.r.mullins g-mail>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Thiago Franco de Moraes <totonixsame@gmail.com>

pkgname=gdcm
pkgver=3.0.23
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
sha512sums=('a1c45434e925ddac293993014686865aecf1b6745013ed6a141b6ee1bdbe7ddef6abcfc2491583e63f33f4292617ee65412da4c41f38731409df9149903a8772')

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
