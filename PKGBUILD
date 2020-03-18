# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=reflective-rapidjson
pkgname=mingw-w64-reflective-rapidjson
_name=${pkgname#mingw-w64-}
pkgver=0.0.13
pkgrel=1
arch=('any')
pkgdesc='Code generator for serializing/deserializing C++ objects to/from JSON using Clang and RapidJSON (mingw-w64)'
license=('GPL')
depends=('mingw-w64-crt' 'mingw-w64-c++utilities' 'mingw-w64-rapidjson' 'reflective-rapidjson')
optdepends=("mingw-w64-boost: use Boost.Hana instead of code generator"
            "$_name-doc: API documentation")
checkdepends=('mingw-w64-cppunit' 'mingw-w64-wine' 'mingw-w64-boost')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake')
url="https://github.com/Martchus/${_reponame}"
source=("${_name}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('978c4d70862f16bb926ba6481ebfd1e650dae02fdcf3c335070748f547745db3')
options=(!buildflags staticlibs !strip !emptydirs)

_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')
_configurations=()
[[ $NO_SHARED_LIBS ]] || _configurations+=('shared')
[[ $NO_STATIC_LIBS ]] || _configurations+=('static')

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"

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
      mkdir -p "build-${_arch}-${_cfg}" && pushd "build-${_arch}-${_cfg}"
      ${_arch}-cmake \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX="/usr/${_arch}" \
        -DCONFIGURATION_NAME:STRING="${_cfg}" \
        -DCONFIGURATION_PACKAGE_SUFFIX:STRING="-${_cfg}" \
        -DNO_GENERATOR:BOOL=ON \
	-DENABLE_TARGETS_FOR_MINGW64_CROSS_PACKAGING:BOOL=ON \
        ${_config_flags[$_cfg]} \
        ../
      make
      popd
    done
  done
}

check() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"

  for _arch in "${_architectures[@]}"; do
    for _cfg in "${_configurations[@]}"; do
      msg2 "${_arch}-${_cfg}"
      pushd "build-${_arch}-${_cfg}"
      make WINEPATH="/usr/${_arch}/bin" WINEDEBUG=-all check
      popd
    done
  done
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"

  for _arch in "${_architectures[@]}"; do
    for _cfg in "${_configurations[@]}"; do
      msg2 "${_arch}-${_cfg}"
      pushd "build-${_arch}-${_cfg}"
      make DESTDIR="${pkgdir}" install-mingw-w64-strip
      popd
    done
  done
}
