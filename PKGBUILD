# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=passwordfile
pkgname=mingw-w64-passwordfile
_name=${pkgname#mingw-w64-}
pkgver=3.1.2
pkgrel=1
arch=('any')
pkgdesc='C++ library to read/write passwords from/to encrypted files using AES-256-CBC via OpenSSL (mingw-w64)'
license=('GPL')
depends=('mingw-w64-crt' 'mingw-w64-c++utilities' 'mingw-w64-openssl')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake')
optdepends=("$pkgname-doc: API documentation")
url="https://github.com/Martchus/${_reponame}"
source=("${_reponame}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('be8a4516787200fca740365a090cc2767ee50753152e0f0d59b631da60d490ee')
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
