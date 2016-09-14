# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=tagparser
pkgname=mingw-w64-tagparser
_name=${pkgname#mingw-w64-}
pkgver=6.0.0
pkgrel=1
arch=('any')
pkgdesc='C++ library for reading and writing MP4/M4A/AAC (iTunes), ID3, Vorbis, Opus, FLAC and Matroska tags (mingw-w64)'
license=('GPL')
depends=('mingw-w64-crt' 'mingw-w64-c++utilities' 'mingw-w64-zlib')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake')
optdepends=("$pkgname-doc: API documentation")
url="https://github.com/Martchus/${_reponame}"
source=("${_reponame}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('0d4bb99ec71a2d11bb9b9ae766e082d0092f82b7d2c7b4d6d760eca9386afbb4')
options=(!buildflags staticlibs !strip !emptydirs)
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
[[ $NO_STATIC_LIBS ]] || _configurations+=('static: -DENABLE_STATIC_LIBS:BOOL=ON -DDISABLE_SHARED_LIBS:BOOL=ON')
[[ $NO_SHARED_LIBS ]] || _configurations+=('shared: -DENABLE_STATIC_LIBS:BOOL=OFF -DDISABLE_SHARED_LIBS:BOOL=OFF')

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  export CXXFLAGS='-O0'
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
