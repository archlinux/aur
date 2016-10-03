# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=cpp-utilities
pkgname=mingw-w64-c++utilities
_name=${pkgname#mingw-w64-}
pkgver=4.1.0
pkgrel=1
arch=('any')
pkgdesc='Common C++ classes and routines such as argument parser, IO and conversion utilities (mingw-w64)'
license=('GPL')
depends=('mingw-w64-crt' 'mingw-w64-libiconv')
optdepends=("$pkgname-doc: API documentation")
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake')
url="https://github.com/Martchus/${_reponame}"
source=("${_name}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('ae00eb82754d9d49b0956444079bb1bcccd345e7ecaf06e3e91f33c81ffe4cbf')
options=(!buildflags staticlibs !strip !emptydirs)
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
[[ $NO_STATIC_LIBS ]] || _configurations+=('static: -DENABLE_STATIC_LIBS:BOOL=ON -DDISABLE_SHARED_LIBS:BOOL=ON')
[[ $NO_SHARED_LIBS ]] || _configurations+=('shared: -DENABLE_STATIC_LIBS:BOOL=OFF -DDISABLE_SHARED_LIBS:BOOL=OFF')

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  for _arch in ${_architectures}; do
    for _config in "${_configurations[@]}"; do
      msg2 "Building ${_config%%: *} version for ${_arch}"
      mkdir -p "build-${_arch}-${_config%%: *}" && pushd "build-${_arch}-${_config%%: *}"
      ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr/${_arch}" ${_config#*: } ../
      make
      popd
    done
  done
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  for _arch in ${_architectures}; do
    for _config in "${_configurations[@]}"; do
      msg2 "Packaging ${_config%%: *} version for ${_arch}"
      mkdir -p "build-${_arch}-${_config%%: *}" && pushd "build-${_arch}-${_config%%: *}"
      make DESTDIR="${pkgdir}" install-mingw-w64-strip
      popd
    done
  done
}
