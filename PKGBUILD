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
pkgver=2503.r45.gde997d6
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

case "$CARCH" in
  x86_64_v2)
    _build_level=2
    ;;
  x86_64_v3)
    _build_level=3
    ;;
  x86_64_v4)
    _build_level=4
    ;;
  *) # no changes; may be user defined
    ;;
esac

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
    #'bylaws.libadrenotools'::'git+https://github.com/bylaws/libadrenotools.git'
    #'curl'::'git+https://github.com/curl/curl.git'
    'cyan4973.xxhash'::'git+https://github.com/Cyan4973/xxHash.git'
    #'dolphin-emu.ext-win-ffmpeg'::'git+https://github.com/dolphin-emu/ext-win-ffmpeg.git'
    #'dolphin-emu.ext-win-qt'::'git+https://github.com/dolphin-emu/ext-win-qt.git'
    'epezent.implot'::'git+https://github.com/epezent/implot.git'
    'fmtlib.fmt'::'git+https://github.com/fmtlib/fmt.git'
    #'google.googletest'::'git+https://github.com/google/googletest.git'
    'gpuopen-librariesandsdks.vulkanmemoryallocator'::'git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git'
    #'khronosgroup.spirv-cross'::'git+https://github.com/KhronosGroup/SPIRV-Cross.git'
    'khronosgroup.vulkan-headers'::'git+https://github.com/KhronosGroup/Vulkan-Headers.git'
    #'libsdl-org.sdl'::'git+https://github.com/libsdl-org/SDL.git'
    #'libusb'::'git+https://github.com/libusb/libusb.git'
    #'libusb.hidapi'::'git+https://github.com/libusb/hidapi.git'
    'lsalzman.enet'::'git+https://github.com/lsalzman/enet.git'
    #'lz4'::'git+https://github.com/lz4/lz4.git'
    'mgba-emu.mgba'::'git+https://github.com/mgba-emu/mgba.git'
    'mozilla.cubeb'::'git+https://github.com/mozilla/cubeb.git'
    #'randy408.libspng'::'git+https://github.com/randy408/libspng.git'
    'retroachievements.rcheevos'::'git+https://github.com/RetroAchievements/rcheevos.git'
    'sfml'::'git+https://github.com/SFML/SFML.git'
    'syoyo.tinygltf'::'git+https://github.com/syoyo/tinygltf.git'
    'zlib-ng'::'git+https://github.com/zlib-ng/zlib-ng.git'
    'zlib-ng.minizip-ng'::'git+https://github.com/zlib-ng/minizip-ng.git'
  )

  local _p
  for _p in ${_sources_add[@]}; do
    source+=("$_p")
    sha256sums+=('SKIP')
  done

  _prepare_dolphin() (
    cd "$srcdir/$_pkgsrc"
    local _submodules=(
      #'bylaws.libadrenotools'::'Externals/libadrenotools'
      #'curl'::'Externals/curl/curl'
      'cyan4973.xxhash'::'Externals/xxhash/xxHash'
      #'dolphin-emu.ext-win-ffmpeg'::'Externals/FFmpeg-bin'
      #'dolphin-emu.ext-win-qt'::'Externals/Qt'
      'epezent.implot'::'Externals/implot/implot'
      'fmtlib.fmt'::'Externals/fmt/fmt'
      #'google.googletest'::'Externals/gtest'
      'gpuopen-librariesandsdks.vulkanmemoryallocator'::'Externals/VulkanMemoryAllocator'
      #'khronosgroup.spirv-cross'::'Externals/spirv_cross/SPIRV-Cross'
      'khronosgroup.vulkan-headers'::'Externals/Vulkan-Headers'
      #'libsdl-org.sdl'::'Externals/SDL/SDL'
      #'libusb'::'Externals/libusb/libusb'
      #'libusb.hidapi'::'Externals/hidapi/hidapi-src'
      'lsalzman.enet'::'Externals/enet/enet'
      #'lz4'::'Externals/lz4/lz4'
      'mgba-emu.mgba'::'Externals/mGBA/mgba'
      'mozilla.cubeb'::'Externals/cubeb/cubeb'
      #'randy408.libspng'::'Externals/libspng/libspng'
      'retroachievements.rcheevos'::'Externals/rcheevos/rcheevos'
      'sfml'::'Externals/SFML/SFML'
      'syoyo.tinygltf'::'Externals/tinygltf/tinygltf'
      'zlib-ng'::'Externals/zlib-ng/zlib-ng'
      'zlib-ng.minizip-ng'::'Externals/minizip-ng/minizip-ng'
    )
    _submodule_update
  )
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

build() {
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

    -DENABLE_AUTOUPDATE=OFF
    # -DENABLE_ANALYTICS=OFF # default:Opt-in
    # -DUSE_SYSTEM_LIBS=ON # default:AUTO

    -DUSE_SANITIZERS=OFF # cubeb

    -DUSE_SYSTEM_ENET=OFF
    -DUSE_SYSTEM_FMT=OFF
    -DUSE_SYSTEM_LIBMGBA=OFF
    -DUSE_SYSTEM_MINIZIP=OFF
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
}

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
