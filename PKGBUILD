# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=passwordfile
pkgname=mingw-w64-passwordfile
_name=${pkgname#mingw-w64-}
pkgver=4.0.0
pkgrel=1
arch=('any')
pkgdesc='C++ library to read/write passwords from/to encrypted files using AES-256-CBC via OpenSSL (mingw-w64)'
license=('GPL')
depends=('mingw-w64-crt' 'mingw-w64-c++utilities' 'mingw-w64-openssl')
optdepends=("$_name-doc: API documentation")
checkdepends=('mingw-w64-cppunit' 'mingw-w64-wine')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake')
url="https://github.com/Martchus/${_reponame}"
source=("${_name}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('4918322b65eb4d70114ff427016decb9dc799c76a97b699b88db4790ae7609e1')
options=(!buildflags staticlibs !strip !emptydirs)
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
[[ $NO_STATIC_LIBS ]] || _configurations='-DENABLE_STATIC_LIBS:BOOL=ON'
[[ $NO_SHARED_LIBS ]] && _configurations+=' -DDISABLE_SHARED_LIBS:BOOL=ON'

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr/${_arch}" ${_configurations} ../
    make
    popd
  done
}

check() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    export WINEPATH="/usr/${_arch}/bin"
    export WINEDEBUG=-all
    make check
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
