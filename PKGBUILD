# Maintainer:

: ${_branch:=master}

_pkgname="hal-emsec"
pkgname="$_pkgname-git"
pkgver=4.4.1.r302.g9900bf1
pkgrel=1
pkgdesc='Hardware Analyzer for Hardware Reversing from emsec'
url="https://github.com/emsec/hal"
license=('MIT')
arch=('x86_64')

depends=(
  'abc'
  'bitwuzla'
  'graphviz'
  'igraph'
  'python'
  'qt5-svg'
  'quazip-qt5'
  'spdlog'
  'z3'
)
makedepends=(
  'boost'
  'cmake'
  'git'
  'ninja'
  'nlohmann-json'
  'pybind11'
  'rapidjson'
)

_source_main() {
  provides=("$_pkgname")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git#branch=${_branch:-master}")
  sha256sums=('SKIP')
}

_source_patch() {
  source+=(
  )
  sha256sums+=(
  )
}

_source_main
_source_patch

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc"

  # igraph on Arch Linux requires build type None
  sed -E -e '/AVAILABLE_BUILD_TYPES/s&Perf&None&' -i CMakeLists.txt
  sed -E -e 's&IMPORTED_LOCATION_RELEASE&IMPORTED_LOCATION_NONE&g' -i cmake/detect_dependencies.cmake

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\nApplying patch: %s\n' "$src"
      patch -Np1 -F100 -i "${srcdir:?}/$src"
    fi
  done
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DBUILD_DOCUMENTATION=OFF
    -DENABLE_INSTALL_LDCONFIG=OFF
    -DENABLE_PPA=OFF
    -DUSE_LIBCXX=OFF
    -DUSE_VENDORED_IGRAPH=OFF
    -DUSE_VENDORED_PYBIND11=OFF
    -DUSE_VENDORED_QUAZIP=OFF
    -DUSE_VENDORED_SPDLOG=OFF
    -DUSE_VENDORED_NLOHMANN_JSON=OFF
    -DBUILD_ALL_PLUGINS=ON
    -DBUILD_TESTS=OFF
    #-DCMAKE_EXPORT_COMPILE_COMMANDS=1
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
