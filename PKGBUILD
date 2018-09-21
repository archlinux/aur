# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=reflective-rapidjson
pkgname=mingw-w64-reflective-rapidjson
_name=${pkgname#mingw-w64-}
pkgver=0.0.5
pkgrel=1
arch=('any')
pkgdesc='Code generator for serializing/deserializing C++ objects to/from JSON using Clang and RapidJSON (mingw-w64)'
license=('GPL')
depends=('mingw-w64-crt' 'mingw-w64-c++utilities' 'mingw-w64-rapidjson' 'reflective-rapidjson')
optdepends=("mingw-w64-boost: use Boost.Hana instead of code generator")
optdepends=("$_name-doc: API documentation")
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake')
url="https://github.com/Martchus/${_reponame}"
source=("${_name}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('7de997399332b723810833756c39b97e2ffa4160d5453ce1e2af6b4f5f4f90a7')
options=(!buildflags staticlibs !strip !emptydirs)
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
[[ $NO_STATIC_LIBS ]] || _configurations='-DENABLE_STATIC_LIBS:BOOL=ON'
[[ $NO_SHARED_LIBS ]] && _configurations+=' -DDISABLE_SHARED_LIBS:BOOL=ON'

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    # disable building the code generator since it is not useful for cross-compilation
    ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="/usr/${_arch}" \
        -DNO_GENERATOR=ON \
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
