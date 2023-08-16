# Maintainer: Hu Butui <hot123tea123@gmail.com>
# Contributor: Matthijs Tadema <M dot J dot Tadema at pm dot me>
# Contributor: Staal <staal1978@gmail.com>
# Contributor: Jens Staal <staal1978@gmail.com>

_pkgname=ugene
pkgname=('ugene' 'ugene-cuda')
pkgver=48.0
pkgrel=2
pkgdesc='A free open-source cross-platform bioinformatics software'
arch=('x86_64')
url='http://ugene.net'
license=('GPL2')
depends=(
  glu
  libxtst
  qt5-script
  qt5-svg
)
makedepends=(
  cuda
  qt5-tools
  opencl-headers
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/ugeneunipro/ugene/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('89324da7f4a67c6b8a1d0d1b7a30099a9cb406fa1bb7a9aea3bd132a2ff9d501')

prepare() {
  cd ${srcdir}
  cp -a ${_pkgname}-${pkgver} ${_pkgname}-cuda-${pkgver}
}

build() {
  # run twice to generate the right installation files
  # see https://github.com/ugeneunipro/ugene/issues/683#issuecomment-1046370388
  cd "${srcdir}/${_pkgname}-${pkgver}"
  qmake -r \
    CONFIG+=x64 \
    UGENE_CUDA_DETECTED=0 \
    UGENE_OPENCL_DETECTED=1 \
    UGENE_USE_BUNDLED_ZLIB=0 \
    UGENE_USE_SYSTEM_SQLITE=1
  make
  qmake -r \
    CONFIG+=x64 \
    UGENE_CUDA_DETECTED=0 \
    UGENE_OPENCL_DETECTED=1 \
    UGENE_USE_BUNDLED_ZLIB=0 \
    UGENE_USE_SYSTEM_SQLITE=1
  make

  cd "${srcdir}/${_pkgname}-cuda-${pkgver}"
  CUDA_LIB_PATH=/opt/cuda/lib64 \
  CUDA_INC_PATH=/opt/cuda/include \
  qmake -r \
    CONFIG+=x64 \
    UGENE_CUDA_DETECTED=1 \
    UGENE_OPENCL_DETECTED=1 \
    UGENE_USE_BUNDLED_ZLIB=0 \
    UGENE_USE_SYSTEM_SQLITE=1
  make
  CUDA_LIB_PATH=/opt/cuda/lib64 \
  CUDA_INC_PATH=/opt/cuda/include \
  qmake -r \
    CONFIG+=x64 \
    UGENE_CUDA_DETECTED=1 \
    UGENE_OPENCL_DETECTED=1 \
    UGENE_USE_BUNDLED_ZLIB=0 \
    UGENE_USE_SYSTEM_SQLITE=1
  make
}

package_ugene() {
  cd "${pkgname}-${pkgver}"
  make install
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/pixmaps"
  # files installed to dist, move them to ${pkgdir}
  cp -a "${srcdir}/${pkgname}-${pkgver}/dist" "${pkgdir}/opt"
  mv -vf "${pkgdir}/opt/${_pkgname}-${pkgver}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  ln -sf "/opt/${_pkgname}-${pkgver}/ugene" "${pkgdir}/usr/bin/ugene"
  ln -sf "/opt/${_pkgname}-${pkgver}/ugeneui" "${pkgdir}/usr/bin/ugeneui"
  ln -sf "/opt/${_pkgname}-${pkgver}/ugenecl" "${pkgdir}/usr/bin/ugenecl"
  mv -vf "${pkgdir}/opt/${_pkgname}-${pkgver}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps"
}

package_ugene-cuda() {
  pkgdesc="${pkgdesc} (with CUDA)"
  provides=(ugene=${pkgver})
  conflicts=(ugene)
  depends+=(
    cuda
)
  cd "${pkgname}-${pkgver}"
  make install
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/pixmaps"
  # files installed to dist, move them to ${pkgdir}
  cp -av "${srcdir}/${pkgname}-${pkgver}/dist" "${pkgdir}/opt"
  mv -vf "${pkgdir}/opt/${_pkgname}-${pkgver}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  ln -sf "/opt/${_pkgname}-${pkgver}/ugene" "${pkgdir}/usr/bin/ugene"
  ln -sf "/opt/${_pkgname}-${pkgver}/ugeneui" "${pkgdir}/usr/bin/ugeneui"
  ln -sf "/opt/${_pkgname}-${pkgver}/ugenecl" "${pkgdir}/usr/bin/ugenecl"
  mv -vf "${pkgdir}/opt/${_pkgname}-${pkgver}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps"
}
