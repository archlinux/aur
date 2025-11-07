# Maintainer:
# Contributor: username227 <gfrank227 [at] gmail [dot] com>

## options
: ${_use_clang:=false}

_pkgname="shadps4"
pkgname="$_pkgname"
pkgver=0.12.5
pkgrel=1
pkgdesc="Sony PlayStation 4 emulator"
url="https://github.com/shadps4-emu/shadPS4"
license=('GPL-2.0-or-later')
arch=('aarch64' 'x86_64')

depends=(
  'glslang'
  'libavcodec.so'    # ffmpeg
  'libavformat.so'   # ffmpeg
  'libavutil.so'     # ffmpeg
  'libfmt.so'        # fmt
  'libpng16.so'      # libpng
  'libswresample.so' # ffmpeg
  'libswscale.so'    # ffmpeg
  'libudev.so'       # systemd-libs
  'libuuid.so'       # util-linux-libs
  'libxxhash.so'     # xxhash
  'libz.so'          # zlib
  'pugixml'
  'sdl3'
)
makedepends=(
  'boost'
  'cmake'
  'git'
  'half'
  'ninja'
  'robin-map'
  'spirv-headers'
  'toml11'
  'nlohmann-json'
)

if [[ "${_use_clang::1}" == "t" ]]; then
  makedepends+=(
    'clang'
    'lld'
  )
fi

options=('!lto')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#tag=v.$pkgver")
sha256sums=('0cd997c23e2aff043879e42f57a12c5f579b27172f837d92987aaf8a1afc54a8')

prepare() {
  cd "$_pkgsrc"
  git rm -r externals/MoltenVK
  git rm -r externals/date
  git rm -r externals/ext-boost
  git rm -r externals/ffmpeg-core
  git rm -r externals/fmt
  git rm -r externals/glslang
  git rm -r externals/half
  git rm -r externals/libpng
  git rm -r externals/pugixml
  git rm -r externals/robin-map
  git rm -r externals/sdl3
  git rm -r externals/toml11
  git rm -r externals/xxhash
  git rm -r externals/zlib-ng
  git submodule update --init --recursive --depth 1

  # remove vendored modules
  sed -E -e '/add_subdirectory/s&^.*\b(ext-boost)\b.*&&' \
    -i externals/CMakeLists.txt

  # disable tracy
  sed -E -e 's&if\s*\(CMAKE_BUILD_TYPE STREQUAL "Release"\)&if (TRUE)&' -i externals/CMakeLists.txt

  # allow any version
  sed -E -e '/find_package/s&(glslang) \S+ (CONFIG)&\1 \2&' -i CMakeLists.txt

  # respect system build flags
  sed -E -e '/march/d' -i CMakeLists.txt

  sed -E -e 's&@APP_IS_RELEASE@&true&' \
    -e 's&@APP_VERSION@&'"${pkgver:?}&" \
    -i src/common/scm_rev.cpp.in

  sed -E -e 's&(fmt::format)\("shadPS4 v&\1("shadPS4 &' \
    -i src/emulator.cpp
}

build() {
  if [[ "${_use_clang::1}" == "t" ]]; then
    export CC CXX LDFLAGS
    CC=clang
    CXX=clang++
    LDFLAGS="$(sed -E -e 's&\S*fuse-ld\S*&&g' -e 's&\s+& &g' <<< "$LDFLAGS") -fuse-ld=lld"
  fi

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_SKIP_RPATH=ON
    -DBUILD_TESTING=OFF
    -Wno-dev

    -DTRACY_ENABLE=OFF
    -DENABLE_UPDATER=OFF
    -DSIRIT_USE_SYSTEM_SPIRV_HEADERS=ON
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  install -Dm755 build/shadps4 "$pkgdir/usr/bin/${_pkgname}"
}
