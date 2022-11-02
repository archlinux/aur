# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=qtforkawesome
_pkgver_forkawesome=1.2.0
_reponame_forkawesome=Fork-Awesome-$_pkgver_forkawesome
pkgname=mingw-w64-qtforkawesome
_name=${pkgname#mingw-w64-}
pkgver=0.1.0
pkgrel=1
arch=('any')
pkgdesc='Library that bundles ForkAwesome for use within Qt applications (mingw-w64)'
license=('GPL')
depends=('mingw-w64-crt' 'mingw-w64-qt5-base')
optdepends=(
  'mingw-w64-qt5-declarative: Qt Quick integration'
  "$_name-doc: API documentation"
)
checkdepends=('mingw-w64-wine')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'mingw-w64-qtutilities' 'mingw-w64-qt5-declarative' 'ninja' 'perl-yaml-libyaml')
url="https://github.com/Martchus/${_reponame}"
source=("${_name}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz"
        "${_reponame_forkawesome}::https://github.com/ForkAwesome/Fork-Awesome/archive/refs/tags/${_pkgver_forkawesome}.tar.gz")
sha256sums=('2d71cc6824148194263fda763a78d3ae7ed5a4d0e673181fc5afeabc47e2445e'
            '23fba5f191f204e0414c547bf4c9b10fd7ca42c151260e8f64698449a75fbdb3')
options=(!buildflags staticlibs !strip !emptydirs)

_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')
_configurations=()
[[ $NO_SHARED_LIBS ]] || _configurations+=('shared')
[[ $NO_STATIC_LIBS ]] || _configurations+=('static') makedepends+=('mingw-w64-qt5-base-static' 'mingw-w64-qt5-declarative-static' 'mingw-w64-qt5-translations')

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
        -DVERSIONED_MINGW_LIBRARIES:BOOL=ON \
        -DFORK_AWESOME_FONT_FILE="$srcdir/${_reponame_forkawesome}/fonts/forkawesome-webfont.ttf" \
        -DFORK_AWESOME_ICON_DEFINITIONS="$srcdir/${_reponame_forkawesome}/src/icons/icons.yml" \
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
