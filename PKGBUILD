# Maintainer: Martchus <martchus@gmx.net>
_name=qtutilities
_reponame=qtutilities
pkgname=mingw-w64-qtutilities
pkgver=3.1.0
pkgrel=1
arch=('any')
pkgdesc="Common Qt related C++ classes and routines used by my applications such as dialogs, widgets and models. (mingw-w64)."
license=('GPL')
depends=('mingw-w64-crt' 'mingw-w64-qt5-base' 'mingw-w64-c++utilities')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake')
url="https://github.com/Martchus/${_reponame}"
source=("qtutilities-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('01f176f139be5bc2bb136428c497a1b491611e51c480d0fb261ae0536a270236')
options=(!buildflags staticlibs !strip !emptydirs)
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  # build utilities for each architecture
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr/${_arch}" ../
    make
    popd
  done
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  for _arch in ${_architectures}; do
    pushd build-${_arch}
    make install-mingw-w64-strip
    popd
  done
}
