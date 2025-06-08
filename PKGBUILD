# Maintainer:
# Contributor: Kerrick Staley <kerrick@kerrickstaley.com>

## links
# https://dolphin-emu.org
# https://github.com/dolphin-emu/dolphin

## options
: ${_debugfast:=false}
: ${_build_unittests:=false}

: ${_branch=master}

: ${_build_clang:=false}

: ${_build_debugfast:=true}
: ${_build_level:=1}
: ${_build_git:=true}

unset _pkgtype
[[ "${_build_debugfast::1}" == "t" ]] && _pkgtype+="-debugfast"
[[ "${_build_level::1}" == "2" ]] && _pkgtype+="-x64v2"
[[ "${_build_level::1}" == "3" ]] && _pkgtype+="-avx"
[[ "${_build_level::1}" == "4" ]] && _pkgtype+="-x64v4"
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

_pkgname="dolphin-emu"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=2506.r98.g5064b61
pkgrel=1
pkgdesc='A Gamecube and Wii emulator'
url="https://github.com/dolphin-emu/dolphin"
license=('GPL-2.0-or-later')
arch=('x86_64' 'x86_64_v2' 'x86_64_v3' 'x86_64_v4')

depends=(
  'alsa-lib'
  'bluez-libs'
  'bzip2'
  'ffmpeg'
  'hidapi'
  'libevdev'
  'libgl'
  'liblzma.so'
  'libpulse'
  'libspng'
  'libudev.so'
  'libusb'
  'libx11'
  'libxi'
  'libxrandr'
  'lz4'
  'lzo'
  'mbedtls2'
  'miniupnpc'
  'pugixml'
  'qt6-base'
  'qt6-svg'
  'sdl2'
  'zstd'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'python'
  'vulkan-headers'
)

if [[ "${_build_unittests::1}" == "t" ]]; then
  checkdepends=('gtest')

  check() {
    ninja -C build unittests
  }
fi

if [[ "${_build_clang::1}" == "t" ]]; then
  makedepends+=(
    clang
    lld
    llvm
  )
else
  options+=(!lto)
fi

_source_main() {
  provides=(
    'dolphin-emu'
    'dolphin-emu-nogui'
    'dolphin-emu-tool'
  )
  conflicts=(
    'dolphin-emu'
    'dolphin-emu-nogui'
    'dolphin-emu-tool'
  )

  options+=(!emptydirs)

  _pkgsrc="$_pkgname"
  source=("$_pkgname"::"git+$url.git#branch=${_branch:-master}")
  sha256sums=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags --abbrev=7 | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
  }
}

_source_dolphin() {
  local _sources_add=(
    #'bylaws.libadrenotools'::'git+https://github.com/bylaws/libadrenotools.git'::'Externals/libadrenotools'
    #'curl'::'git+https://github.com/curl/curl.git'::'Externals/curl/curl'
    'cyan4973.xxhash'::'git+https://github.com/Cyan4973/xxHash.git'::'Externals/xxhash/xxHash'
    #'dolphin-emu.ext-win-ffmpeg'::'git+https://github.com/dolphin-emu/ext-win-ffmpeg.git'::'Externals/FFmpeg-bin'
    #'dolphin-emu.ext-win-qt'::'git+https://github.com/dolphin-emu/ext-win-qt.git'::'Externals/Qt'
    'e-dant.watcher'::'git+https://github.com/e-dant/watcher.git'::'Externals/watcher/watcher'
    'epezent.implot'::'git+https://github.com/epezent/implot.git'::'Externals/implot/implot'
    'facebook.zstd'::'git+https://github.com/facebook/zstd.git'::'Externals/zstd/zstd'
    'fmtlib.fmt'::'git+https://github.com/fmtlib/fmt.git'::'Externals/fmt/fmt'
    #'google.googletest'::'git+https://github.com/google/googletest.git'::'Externals/gtest'
    'gpuopen-librariesandsdks.vulkanmemoryallocator'::'git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git'::'Externals/VulkanMemoryAllocator'
    #'khronosgroup.spirv-cross'::'git+https://github.com/KhronosGroup/SPIRV-Cross.git'::'Externals/spirv_cross/SPIRV-Cross'
    #'khronosgroup.vulkan-headers'::'git+https://github.com/KhronosGroup/Vulkan-Headers.git'::'Externals/Vulkan-Headers'
    #'libsdl-org.sdl'::'git+https://github.com/libsdl-org/SDL.git'::'Externals/SDL/SDL'
    #'libusb'::'git+https://github.com/libusb/libusb.git'::'Externals/libusb/libusb'
    #'libusb.hidapi'::'git+https://github.com/libusb/hidapi.git'::'Externals/hidapi/hidapi-src'
    'lsalzman.enet'::'git+https://github.com/lsalzman/enet.git'::'Externals/enet/enet'
    #'lz4'::'git+https://github.com/lz4/lz4.git'::'Externals/lz4/lz4'
    'mgba-emu.mgba'::'git+https://github.com/mgba-emu/mgba.git'::'Externals/mGBA/mgba'
    'mozilla.cubeb'::'git+https://github.com/mozilla/cubeb.git'::'Externals/cubeb/cubeb'
    #'randy408.libspng'::'git+https://github.com/randy408/libspng.git'::'Externals/libspng/libspng'
    'retroachievements.rcheevos'::'git+https://github.com/RetroAchievements/rcheevos.git'::'Externals/rcheevos/rcheevos'
    'sfml'::'git+https://github.com/SFML/SFML.git'::'Externals/SFML/SFML'
    'syoyo.tinygltf'::'git+https://github.com/syoyo/tinygltf.git'::'Externals/tinygltf/tinygltf'
    'zlib-ng'::'git+https://github.com/zlib-ng/zlib-ng.git'::'Externals/zlib-ng/zlib-ng'
    'zlib-ng.minizip-ng'::'git+https://github.com/zlib-ng/minizip-ng.git'::'Externals/minizip-ng/minizip-ng'
  )

  local _p _idx _src _sm_prep _sm_func
  for _p in ${_sources_add[@]}; do
    _idx="${_p%%::*}"
    _sm_prep+=("${_idx}::${_p##*::}")
    _src="${_p%::*}"
    source+=("$_src")
    sha256sums+=('SKIP')
  done

  eval "_prepare_dolphin() (
    cd \"\$srcdir/\$_pkgsrc\"
    local _submodules=(${_sm_prep[@]})
    _submodule_update
  )"
}

_source_main
_source_dolphin

prepare() {
  _submodule_update() {
    local _module
    for _module in "${_submodules[@]}"; do
      git submodule init "${_module##*::}"
      git submodule set-url "${_module##*::}" "$srcdir/${_module%::*}"
      git -c protocol.file.allow=always submodule update "${_module##*::}"
    done
  }

  _run_if_exists _prepare_dolphin

  # Delete gcc specific options
  sed '/_ARCHIVE_/d' -i "$srcdir/$_pkgsrc/CMakeLists.txt"
}

build() (
  export CC CXX CFLAGS CXXFLAGS LDFLAGS
  local _pkgver _cmake_options _ldflags _cflags _cxxflags

  # Fix version string
  _pkgver=$(pkgver)
  install /dev/stdin "$srcdir/$_pkgsrc/Source/Core/Common/scmrev.h.in" << END
#define SCM_REV_STR "\${DOLPHIN_WC_REVISION}"
#define SCM_DESC_STR "${_pkgver:?}"
#define SCM_BRANCH_STR "${_branch:-master}"
#define SCM_COMMITS_AHEAD_MASTER 0
#define SCM_DISTRIBUTOR_STR "aur.archlinux.org"
#define SCM_UPDATE_TRACK_STR ""
END

  _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5

    -DENABLE_AUTOUPDATE=OFF
    # -DENABLE_ANALYTICS=OFF # default:Opt-in
    # -DUSE_SYSTEM_LIBS=ON # default:AUTO

    -DUSE_SANITIZERS=OFF # cubeb

    -DUSE_SYSTEM_ENET=OFF
    -DUSE_SYSTEM_FMT=OFF
    -DUSE_SYSTEM_LIBMGBA=OFF
    -DUSE_SYSTEM_XXHASH=OFF
    -Wno-dev
  )

  if [ "${_debugfast::1}" == "t" ]; then
    _cmake_options+=(-DFASTLOG=ON)
  fi

  if [[ "${_build_unittests::1}" == "t" ]]; then
    _cmake_options+=(-DENABLE_TESTS=ON)
  else
    _cmake_options+=(-DENABLE_TESTS=OFF)
  fi

  if [[ "${_build_clang::1}" == "t" ]]; then
    CC=clang
    CXX=clang++

    _ldflags=(${LDFLAGS})
    LDFLAGS="${_ldflags[@]//*fuse-ld*/} -fuse-ld=lld"

    _cmake_options+=(
      -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON
      -DENABLE_LTO=ON
    )
  else
    _cmake_options+=(-DENABLE_LTO=OFF)
  fi

  if [[ ${_build_level::1} =~ ^[2-4]$ ]]; then
    _cflags=(
      -march=x86-64-v${_build_level::1} -mtune=generic -O3
      $(sed -E -e 's&-(march|mtune)=\S+\b&&g' -e 's&-O[0-9]+\b&&g' <<< "${CFLAGS}")
    )
    CFLAGS="${_cflags[@]}"

    _cxxflags=(
      -march=x86-64-v${_build_level::1} -mtune=generic -O3
      $(sed -E -e 's&-(march|mtune)=\S+\b&&g' -e 's&-O[0-9]+\b&&g' <<< "${CXXFLAGS}")
    )
    CXXFLAGS="${_cxxflags[@]}"
  fi

  cmake "${_cmake_options[@]}"
  cmake --build build
)

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir/$_pkgsrc/Data/51-usb-device.rules" \
    "$pkgdir/usr/lib/udev/rules.d/51-usb-device-dolphin.rules"

  rm -rf "$pkgdir"/usr/{include,lib/libdiscord-rpc.a}
}

_run_if_exists() {
  if declare -F "$1" > /dev/null; then
    eval "$1"
  fi
}
