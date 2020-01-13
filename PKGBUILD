# Maintainer: Lubosz Sarnecki < lubosz at gmail dot com >

basename=compressonator
pkgname=$basename-git
pkgver=v3.2.4691+44+gbfc4b162
pkgrel=1
pkgdesc="Tool suite for Texture and 3D Model Compression, Optimization and Analysis. Lubosz's Linux GUI port branch."
arch=('x86_64')
url="https://github.com/GPUOpen-Tools/Compressonator"
license=('MIT')
replaces=('compressonator-cli-bin')
conflicts=('compressonator-cli-bin')
makedepends=('cmake' 'git' 'boost')
depends=('qt5-webengine' 'boost-libs' 'opencv' 'draco-git')
source=("git+https://github.com/lubosz/Compressonator.git#branch=gui-cmake-qt5-linux")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/Compressonator"
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd "${srcdir}"
  rm build -rf && mkdir -p build
  cd build
  cmake ../Compressonator/Compressonator \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_SBINDIR=bin \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=on
  make
}

package() {
  cd "${srcdir}/build"
  DESTDIR="${pkgdir}" make install
  mv ${pkgdir}/usr/bin/CompressonatorCLI-bin ${pkgdir}/usr/bin/compressonator-cli

  install -Dm644 "${srcdir}"/Compressonator/Compressonator/License/GUILicense.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
