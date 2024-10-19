# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Fredrik Strandin <fredrik@strandin.name>
pkgname=dspdfviewer
pkgver=1.15.1
pkgrel=5
pkgdesc="Viewer for latex-beamer presentations that are built with the «show notes on second screen»-option"
arch=(i686 x86_64)
url="https://github.com/dannyedel/${pkgname}"
license=(GPL-2.0-or-later)
depends=(boost-libs qt5-base poppler-qt5)
makedepends=(cmake boost qt5-tools)
optdepends=('man-db: manual pages for dspdfviewer')
conflicts=(${pkgname}-git)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
  qt5.patch::${url}/commit/e52ffb6bd73c5cfdaf59e6d9ff5fe04c10f915c8.patch)
sha512sums=('41de12554224c0ba60ec93f398e77f437d01548d5b72c955c39db59845ee33cfed5512abc705d6ef1b6aeb605715335015f8bbb933b6748ef8f14c7a2cc8eb03'
  'aead14c037c4b3b0f52e6c8758073a8ec6a7ac071f66ee7222b28334310daf436314e383f650353b08064007e8342def801cb396bea4e8cc453dc5bde049d0dc')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i ../qt5.patch
}

build() {
  cmake \
    -S ${pkgname}-${pkgver} \
    -B build \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_CXX_STANDARD=14 \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBuildTests=OFF \
    -DCMAKE_CXX_FLAGS="-Wno-error=deprecated-declarations -Wno-error=cpp" \
    -DDSPDFVIEWER_VERSION="${pkgver}" \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm644 ${pkgname}-${pkgver}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
