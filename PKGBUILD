# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=cpp-utilities
pkgname=mingw-w64-c++utilities
_name=${pkgname#mingw-w64-}
pkgver=4.13.0
pkgrel=1
arch=('any')
pkgdesc='Common C++ classes and routines such as argument parser, IO and conversion utilities (mingw-w64)'
license=('GPL')
depends=('mingw-w64-crt' 'mingw-w64-libiconv')
optdepends=("$_name-doc: API documentation")
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake')
url="https://github.com/Martchus/${_reponame}"
source=("${_name}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('dbf68dc8b9fa154b753403acfe66348c1f66f83782b662b9fcf6c73f301defcc')
options=(!buildflags staticlibs !strip !emptydirs)
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
[[ $NO_STATIC_LIBS ]] || _configurations='-DENABLE_STATIC_LIBS:BOOL=ON'
[[ $NO_SHARED_LIBS ]] && _configurations+=' -DDISABLE_SHARED_LIBS:BOOL=ON'

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="/usr/${_arch}" \
        -DUSE_NATIVE_FILE_BUFFER=ON \
        ${_configurations} \
        ../
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
