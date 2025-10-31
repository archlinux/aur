# Maintainer:

_pkgname="ymir-emu"
pkgname="$_pkgname-git"
pkgver=0.2.0.r33.g84bd519
pkgrel=1
pkgdesc="Sega Saturn emulator"
url="https://github.com/StrikerX3/Ymir"
license=('GPL-3.0-only')
arch=('x86_64')

depends=(
  'libfmt.so'    # fmt
  'librtmidi.so' # rtmidi
  'sdl3'
)
makedepends=(
  'cereal'
  'chrono-date'
  'cmake'
  'cxxopts'
  'git'
  'libngtcp2'
  'ninja'
  'nlohmann-json'
  'stb'
  'tomlplusplus'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"
  "semver"::"git+https://github.com/Neargye/semver.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

prepare() {
  cd "$_pkgsrc"
  git submodule update --init --recursive --depth=1

  # allow find modules; config may not exist
  sed -E -e '/find_package/s&\bCONFIG\b&&g' \
    -i apps/ymir-sandbox/CMakeLists.txt \
    apps/ymir-sdl3/CMakeLists.txt

  # set location of cmake modules
  sed -e '1i list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")' -i apps/CMakeLists.txt

  # add missing include
  sed -e '1a include_directories(${CMAKE_SOURCE_DIR}/../semver/include)' -i apps/CMakeLists.txt

  # stb is header only
  sed -E -e '/find_package\(Stb/d' \
    -i apps/ymir-sandbox/CMakeLists.txt \
    apps/ymir-sdl3/CMakeLists.txt

  # don't force libcurl_static
  sed -E -e 's&(CURL::libcurl)_static\b&\1&' \
    -i apps/ymir-sandbox/CMakeLists.txt \
    apps/ymir-sdl3/CMakeLists.txt

  # find module for rtmidi
  cat > cmake/Findrtmidi.cmake << 'END'
find_path(RTMIDI_INCLUDE_DIR RtMidi.h
    PATH_SUFFIXES rtmidi
)

find_library(RTMIDI_LIBRARY NAMES rtmidi)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(RtMidi DEFAULT_MSG
    RTMIDI_INCLUDE_DIR RTMIDI_LIBRARY
)

if(RTMIDI_FOUND)
    add_library(RtMidi::rtmidi UNKNOWN IMPORTED)
    set_target_properties(RtMidi::rtmidi PROPERTIES
        IMPORTED_LOCATION "${RTMIDI_LIBRARY}"
        INTERFACE_INCLUDE_DIRECTORIES "${RTMIDI_INCLUDE_DIR}"
    )
endif()
END
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev

    -DYmir_ENABLE_DEVLOG=OFF
    -DYmir_ENABLE_IMGUI_DEMO=OFF
    -DYmir_ENABLE_IPO=OFF
    -DYmir_ENABLE_TESTS=$CHECKFUNC
    -DYmir_ENABLE_UPDATE_CHECKS=OFF
    -DYmir_EXTRA_INLINING=OFF

    -DYmir_DEV_BUILD=OFF
    -DYmir_VERSION_PRERELEASE=AUR

    # extra binaries
    -DYmir_ENABLE_SANDBOX=ON
    -DYmir_ENABLE_YMDASM=ON

    -DStb_INCLUDE_DIR=/usr/include/stb
  )

  # Edit /etc/makepkg.conf to enable AVX2
  if g++ -x c++ - $CXXFLAGS -o /dev/null &> /dev/null << 'END'; then
#include <immintrin.h>
int main() {
  __m256i v = _mm256_add_epi32(_mm256_set1_epi32(1), _mm256_set1_epi32(2));
  (void)v;
  return 0;
}
END
    _cmake_options+=(-DYmir_AVX2=ON)
  else
    _cmake_options+=(-DYmir_AVX2=OFF)
  fi

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  # binary
  install -Dm755 "$(realpath build/apps/ymir-sdl3/ymir-sdl3)" "$pkgdir/usr/bin/$_pkgname"

  # license
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"

  # icon
  install -Dm644 "$_pkgsrc"/apps/ymir-sdl3/res/ymir.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  # launcher
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=ymir
GenericName=$_pkgdesc
Comment=$_pkgdesc
Exec=$_pkgname
Icon=$_pkgname
StartupWMClass=$_pkgname
Categories=Game;Emulator;
END
}
