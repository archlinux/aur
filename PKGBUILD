# Maintainer: xiota / aur.chaotic.cx
# Contributor: Darvin Delgado <dnmodder@gmail.com>
# Contributor: Mesmer <mesmer@fisica.if.uff.br>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: aldelaro5 <aldelaro5@gmail.com>

_pkgname="decaf-emu"
pkgname="$_pkgname-git"
pkgver=r5222.e6c528a
pkgrel=1
pkgdesc="An experimental open-source Nintendo Wii U emulator"
url="https://github.com/decaf-emu/decaf-emu"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'c-ares'
  'ffmpeg'
  'libuv'
  'qt6-base'
  'qt6-svg'
  'vulkan-icd-loader'

  ## implicit
  #curl
  #libxcb
  #openssl
  #sdl2
  #zlib
)
makedepends=(
  'clang'
  'cmake'
  'git'
  'mold'
  'ninja'
  'python'
)

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"

  # decaf-emu submodules
  "addrlib"::"git+https://github.com/decaf-emu/addrlib"
  "catch"::"git+https://github.com/philsquared/Catch"
  "cereal"::"git+https://github.com/USCiLab/cereal"
  "cnl"::"git+https://github.com/johnmcfarlane/cnl"
  "cpp-peglib"::"git+https://github.com/yhirose/cpp-peglib"
  "excmd"::"git+https://github.com/exjam/excmd"
  "fmt"::"git+https://github.com/fmtlib/fmt"
  "glslang"::"git+https://github.com/KhronosGroup/glslang"
  "gsl-lite"::"git+https://github.com/gsl-lite/gsl-lite"
  "imgui"::"git+https://github.com/ocornut/imgui"
  "libbinrec"::"git+https://github.com/decaf-emu/libbinrec"
  "ovsocket"::"git+https://github.com/exjam/ovsocket"
  "pugixml"::"git+https://github.com/zeux/pugixml"
  "qtads"::"git+https://github.com/githubuser0xFFFF/Qt-Advanced-Docking-System"
  "spdlog"::"git+https://github.com/gabime/spdlog"
  "tomlplusplus"::"git+https://github.com/marzer/tomlplusplus"
  "vcpkg"::"git+https://github.com/microsoft/vcpkg"

  # tomlplusplus submodules
  "Catch2"::"git+https://github.com/catchorg/Catch2"
  "json"::"git+https://github.com/nlohmann/json"
  "tloptional"::"git+https://github.com/TartanLlama/optional"
  "toml-spec-tests"::"git+https://github.com/iarna/toml-spec-tests"
  "toml-test"::"git+https://github.com/BurntSushi/toml-test"
)
sha256sums=(
  'SKIP'

  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'

  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$_pkgsrc"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  # decaf-emu submodules
  cd "$_pkgsrc"
  _submodules=(
    'libraries/addrlib'
    'libraries/catch'
    'libraries/cereal'
    'libraries/cnl'
    'libraries/cpp-peglib'
    'libraries/excmd'
    'libraries/fmt'
    'libraries/glslang'
    'libraries/gsl-lite'
    'libraries/imgui'
    'libraries/libbinrec'
    'libraries/ovsocket'
    'libraries/pugixml'
    'libraries/qtads'
    'libraries/spdlog'
    'libraries/tomlplusplus'
    'libraries/vcpkg'
  )
  for submodule in ${_submodules[@]}; do
    mkdir -p "$submodule"
    git submodule init ${submodule}
    git submodule set-url ${submodule} "${srcdir}/${submodule##*/}"
    git -c protocol.file.allow=always submodule update ${submodule}
  done

  # tomlplusplus submodules
  cd "libraries/tomlplusplus"
  _submodules=(
    'external/Catch2'
    'external/json'
    'external/tloptional'
    'external/toml-spec-tests'
    'external/toml-test'
  )
  for submodule in ${_submodules[@]}; do
    mkdir -p "$submodule"
    git submodule init ${submodule}
    git submodule set-url ${submodule} "${srcdir}/${submodule##*/}"
    git -c protocol.file.allow=always submodule update ${submodule}
  done

  # any remaining submodules
  cd "$srcdir/$_pkgname"
  git submodule sync
  git submodule update --init --recursive

  # Force Qt5
  #sed -Ei -e 's@find_package\(Qt6 COMPONENTS@find_package(Qt5 5.15 COMPONENTS@' CMakeLists.txt
}

build() {
  export CC CXX CFLAGS CXXFLAGS LDFLAGS
  CC=clang
  CXX=clang++
  LDFLAGS+=" -fuse-ld=mold"

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DDECAF_JIT_PROFILING=ON
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
