# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Chris <christopher.r.mullins g-mail>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Thiago Franco de Moraes <totonixsame@gmail.com>

pkgname=gdcm
pkgver=3.0.25
pkgrel=1
pkgdesc="C++ library for DICOM medical files"
arch=(x86_64)
url="https://github.com/malaterre/GDCM"
license=(BSD-3-Clause)
depends=(glibc gcc-libs openjpeg2)
makedepends=(cmake python swig)
optdepends=('python: python bindings')
provides=(libgdcmMEXD.so libgdcmDSED.so libgdcmMSFF.so)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/malaterre/GDCM/archive/v${pkgver}.tar.gz")
sha512sums=('5112679bb42e1d5a47abe8ec482810e190a7b49973cd0ddb3087bc64f8f36ce59c174b414c5fe64671b380f39ec4dca4610ca059de261118c26666d974890265')

build() {
  pysitepackages=$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')
  echo $pysitepackages

  local _flags=(
    -DGDCM_BUILD_APPLICATIONS:BOOL=ON
    -DGDCM_BUILD_SHARED_LIBS:BOOL=ON
    -DGDCM_BUILD_TESTING:BOOL=OFF
    -DGDCM_BUILD_DOCBOOK_MANPAGES:BOOL=OFF
    -DGDCM_USE_SYSTEM_OPENJPEG:BOOL=ON
    -DGDCM_USE_VTK:BOOL=OFF
    -DGDCM_WRAP_PYTHON:BOOL=ON
    -DGDCM_INSTALL_PYTHONMODULE_DIR:STRING="$pysitepackages"
  )

  cmake -B build -S "GDCM-${pkgver}" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "GDCM-${pkgver}/Copyright.txt" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
