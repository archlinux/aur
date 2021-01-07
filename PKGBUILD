# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=qtutilities
pkgname=mingw-w64-qtutilities
_name=${pkgname#mingw-w64-}
pkgver=6.3.3
pkgrel=1
arch=('any')
pkgdesc='Common Qt related C++ classes and routines used by my applications such as dialogs, widgets and models (mingw-w64)'
license=('GPL')
depends=('mingw-w64-crt' 'mingw-w64-qt5-base' 'mingw-w64-c++utilities')
optdepends=("$_name-doc: API documentation")
checkdepends=('mingw-w64-wine')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'mingw-w64-qt5-tools' 'ninja')
url="https://github.com/Martchus/${_reponame}"
source=("${_name}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('7f9054cdabdbf6e0afd7f27ae8ced59121349b5fcf15ce2638b5aa852d46ab4a')
options=(!buildflags staticlibs !strip !emptydirs)

_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')
_configurations=()
[[ $NO_SHARED_LIBS ]] || _configurations+=('shared')
[[ $NO_STATIC_LIBS ]] || _configurations+=('static') makedepends+=('mingw-w64-qt5-base-static' 'mingw-w64-qt5-translations')

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
        -DBUILTIN_TRANSLATIONS:BOOL=ON
        -DQT_PACKAGE_PREFIX=StaticQt5
        -DKF_PACKAGE_PREFIX=StaticKF5
    '
  )

  for _arch in "${_architectures[@]}"; do
    for _cfg in "${_configurations[@]}"; do
      msg2 "${_arch}-${_cfg}"
      mkdir -p "build-${_arch}-${_cfg}" && pushd "build-${_arch}-${_cfg}"
      ${_arch}-cmake \
        -G Ninja \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX="/usr/${_arch}" \
        -DCONFIGURATION_NAME:STRING="${_cfg}" \
        -DCONFIGURATION_PACKAGE_SUFFIX:STRING="-${_cfg}" \
        -DENABLE_TARGETS_FOR_MINGW64_CROSS_PACKAGING:BOOL=ON \
        ${_config_flags[$_cfg]} \
        ../
      ninja
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
      export WINEPATH="/usr/${_arch}/bin" WINEDEBUG=-all
      export QT_QPA_PLATFORM=offscreen
      [[ $_cfg == shared ]] && ninja tests
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
      DESTDIR="${pkgdir}" ninja install-mingw-w64-strip
      popd
    done
  done
}
