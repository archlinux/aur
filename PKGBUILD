# Maintainer: aur.chaotic.cx
# Contributor: username227 <gfrank227 [at] gmail [dot] com>

## options
: ${_use_clang:=false}

_pkgname="shadps4"
pkgname="$_pkgname"
pkgver=0.16.0
pkgrel=1
pkgdesc="Sony PlayStation 4 emulator"
url="https://github.com/shadps4-emu/shadPS4"
license=('GPL-2.0-or-later')
arch=('aarch64' 'x86_64')

depends=(
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
  'miniz'
  'pugixml'
  'sdl3'
)
makedepends=(
  'boost'
  'cmake'
  'git'
  'half'
  'ninja'
  'nlohmann-json'
  'robin-map'
  'spirv-headers'
  'stb'
  'toml11'
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
sha256sums=('b46f6d8ed12b424d68dafa78100bf0e7d9644a3aa8c33c086304d3114d4e903e')

prepare() {
  cd "$_pkgsrc"
  git rm -r externals/MoltenVK
  git rm -r externals/date
  git rm -r externals/ext-boost
  git rm -r externals/ffmpeg-core
  git rm -r externals/fmt
  git rm -r externals/glslang
  git rm -r externals/half
  git rm -r externals/json
  git rm -r externals/libpng
  git rm -r externals/miniz
  git rm -r externals/pugixml
  git rm -r externals/robin-map
  git rm -r externals/sdl3
  git rm -r externals/stb
  git rm -r externals/toml11
  git rm -r externals/xxhash
  git rm -r externals/zlib-ng
  git submodule update --init --recursive --depth 1

  # revert pull/4322; selects wrong gpu device
  git revert -n -m1 a762f70df3fc23185540f88724b261b065e5d979

  # allow any version
  sed -E -e '/find_package/s&(glslang) \S+ (CONFIG)&\1 \2&' -i CMakeLists.txt

  # respect system build flags
  sed -E -e '/march/d' -i CMakeLists.txt

  # set version info
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

  # no longer buildable with pure v1
  export CFLAGS+=" -msse4.1 -DNDEBUG"
  export CXXFLAGS+=" -msse4.1 -DNDEBUG"

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_SKIP_RPATH=ON
    -DBUILD_TESTING=OFF
    -Wno-dev

    -DENABLE_UPDATER=OFF
    -DSIRIT_USE_SYSTEM_SPIRV_HEADERS=ON
    -DTRACY_ENABLE=OFF
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  install -Dm755 build/shadps4 "$pkgdir/usr/bin/${_pkgname}"
}
