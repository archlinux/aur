# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=reflective-rapidjson
pkgname=mingw-w64-reflective-rapidjson
_name=${pkgname#mingw-w64-}
pkgver=0.0.16
pkgrel=1
arch=('any')
pkgdesc='Code generator for serializing/deserializing C++ objects to/from JSON using Clang and RapidJSON (mingw-w64)'
license=(GPL-2.0-or-later)
depends=('mingw-w64-crt' 'mingw-w64-c++utilities' 'mingw-w64-rapidjson' 'reflective-rapidjson')
optdepends=("mingw-w64-boost: use Boost.Hana instead of code generator"
            "$_name-doc: API documentation")
checkdepends=('mingw-w64-cppunit' 'mingw-w64-wine' 'mingw-w64-boost')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'ninja')
url="https://github.com/Martchus/${_reponame}"
source=("${_name}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('12496b8d334e8e1245f05de17c81e269365e9b02e7a14da4274ccf643a19609f')
options=(!buildflags staticlibs !strip !emptydirs)

_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')
_configurations=()
[[ $NO_SHARED_LIBS ]] || _configurations+=('shared')
[[ $NO_STATIC_LIBS ]] || _configurations+=('static')

build() {
  declare -A _config_flags=(
    [shared]='
        -DBUILD_SHARED_LIBS:BOOL=ON
    '
    [static]='
        -DBUILD_SHARED_LIBS:BOOL=OFF
        -DCMAKE_FIND_LIBRARY_SUFFIXES:STRING=.a;.lib
        -DSTATIC_LINKAGE:BOOL=ON
        -DSTATIC_LIBRARY_LINKAGE:BOOL=ON
    '
  )
  for _arch in "${_architectures[@]}"; do
    for _cfg in "${_configurations[@]}"; do
      msg2 "${_arch}-${_cfg}"
      ${_arch}-cmake \
        -G Ninja \
        -S "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}" \
        -B "build-${_arch}-${_cfg}" \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX="/usr/${_arch}" \
        -DCONFIGURATION_NAME:STRING="${_cfg}" \
        -DCONFIGURATION_PACKAGE_SUFFIX:STRING="-${_cfg}" \
        -DNO_GENERATOR:BOOL=ON \
        -DENABLE_TARGETS_FOR_MINGW64_CROSS_PACKAGING:BOOL=ON \
        -DVERSIONED_MINGW_LIBRARIES:BOOL=ON \
        ${_config_flags[$_cfg]}
      VERBOSE=1 cmake --build "build-${_arch}-${_cfg}"
    done
  done
}

check() {
  for _arch in "${_architectures[@]}"; do
    for _cfg in "${_configurations[@]}"; do
      msg2 "${_arch}-${_cfg}"
      export WINEPATH="/usr/${_arch}/bin" WINEDEBUG=-all
      [[ $_cfg == shared ]] && cmake --build "build-${_arch}-${_cfg}" --target check || true
    done
  done
}

package() {
  for _arch in "${_architectures[@]}"; do
    for _cfg in "${_configurations[@]}"; do
      msg2 "${_arch}-${_cfg}"
      DESTDIR="${pkgdir}" cmake --build "build-${_arch}-${_cfg}" --target install-mingw-w64-strip
    done
  done
}
