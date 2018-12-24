# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=qtutilities
pkgname=mingw-w64-qtutilities
_name=${pkgname#mingw-w64-}
pkgver=5.12.1
pkgrel=1
arch=('any')
pkgdesc='Common Qt related C++ classes and routines used by my applications such as dialogs, widgets and models (mingw-w64)'
license=('GPL')
depends=('mingw-w64-crt' 'mingw-w64-qt5-base' 'mingw-w64-c++utilities')
optdepends=("$_name-doc: API documentation")
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'mingw-w64-qt5-tools')
url="https://github.com/Martchus/${_reponame}"
source=("${_name}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('1a981321ac7d1f6af408e6ddb1c19a14f3abd62b054b6144f362b60f1687d681')
options=(!buildflags staticlibs !strip !emptydirs)
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
[[ $NO_STATIC_LIBS ]] ||
  makedepends+=('mingw-w64-qt5-base-static' 'mingw-w64-qt5-svg') \
  optdepends+=('mingw-w64-qt5-base-static: use of static library'
               'mingw-w64-qt5-svg: use of static library') \
  _configurations='-DENABLE_STATIC_LIBS:BOOL=ON'
[[ $NO_SHARED_LIBS ]] && _configurations+=' -DDISABLE_SHARED_LIBS:BOOL=ON'

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  export PREVENT_FORCING_SHARED_LIBS=ON
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="/usr/${_arch}" \
        -DBUILTIN_TRANSLATIONS:BOOL=ON \
        ${_configurations} ../
    make
    popd
  done
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    make DESTDIR="${pkgdir}" install-mingw-w64-strip
    popd
  done
}
