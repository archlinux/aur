# Maintainer: Emiliano Bovetti <emiliano.bovetti at gmail dot com>

pkgname=serconv
pkgver=1.3.1
pkgrel=1
pkgdesc='Batch conversion of hyper-spectral SER files to TIFF'
url='https://jesseds.gitlab.io/serconv'
arch=(x86_64 aarch64)
license=(GPL-3.0-or-later)
depends=(libtiff qt6-base openssl)
makedepends=(git cmake)
source=("https://gitlab.com/jesseds/serconv/-/archive/v${pkgver}/serconv-v${pkgver}.tar.gz" serconv.desktop)
sha256sums=('d4449fa9d7ed5a8a59c7f7b56e0db84a12bb5386663de7fd7215bfc73c70c298'
            'a3e8a32332b256af361f8bfb1591c4c202fedb143685bd11660eae1b022793fd')

prepare() {
  sed -i \
    's/OPENSSL_USE_STATIC_LIBS TRUE/OPENSSL_USE_STATIC_LIBS FALSE/' \
    "${srcdir}/serconv-v${pkgver}/CMakeLists.txt"
}

build() {
  cmake \
    -S "${srcdir}/serconv-v${pkgver}" \
    -B "${srcdir}/build-serconv-v${pkgver}"

  cmake --build "${srcdir}/build-serconv-v${pkgver}"
  make --directory="${srcdir}/build-serconv-v${pkgver}" preinstall
}

package() {
  install -Dm755 "${srcdir}/build-serconv-v${pkgver}/serconv" "${pkgdir}/usr/bin/serconv"
  install -Dm644 "${srcdir}/serconv-v${pkgver}/icons/logo.svg" "${pkgdir}/usr/share/pixmaps/serconv.svg"
  install -Dm644 "${srcdir}/serconv.desktop" "${pkgdir}/usr/share/applications/serconv.desktop"
}
