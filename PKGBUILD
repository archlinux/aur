# Maintainer:
# Contributor: Kerrick Staley <kerrick@kerrickstaley.com>

## useful links
# https://dolphin-emu.org
# https://github.com/dolphin-emu/dolphin

## options
: ${_debugfast:=false}
: ${_build_unittests:=false}

: ${_build_clang:=false}

: ${_build_debugfast:=true}
: ${_build_avx:=false}
: ${_build_git:=true}

unset _pkgtype
[[ "${_build_debugfast::1}" == "t" ]] && _pkgtype+="-debugfast"
[[ "${_build_avx::1}" == "t" ]] && _pkgtype+="-avx"
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

# basic info
_pkgname="dolphin-emu"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=2407.r68.gcc3ff34
pkgrel=1
pkgdesc='A Gamecube and Wii emulator'
url="https://github.com/dolphin-emu/dolphin"
license=('GPL-2.0-or-later')
arch=(x86_64)

# main package
_main_package() {
  depends=(
    alsa-lib
    bluez-libs
    curl
    ffmpeg
    gcc-libs
    glibc
    libevdev
    libgl
    libpulse
    libudev.so
    libx11
    libxi
    libxrandr
    qt6-base
    qt6-svg

    ## optional
    bzip2
    cubeb
    curl
    fmt
    hidapi
    libiconv
    liblzma.so
    libspng
    libusb
    lz4
    lzo
    mbedtls2
    miniupnpc
    pugixml
    sdl2
    sfml
    zstd

    ## broken
    #enet
    #libmgba
    #minizip-ng
    #xxhash
    #zlib-ng
  )
  makedepends+=(
    cmake
    git
    ninja
    python
  )

  if [[ "${_build_unittests::1}" == "t" ]]; then
    checkdepends=('gtest')

    check() {
      ninja -C build unittests
    }
  fi

  options=(!emptydirs)

  if [[ "${_build_clang::1}" == "t" ]]; then
    makedepends+=(
      clang
      lld
      llvm
    )
  else
    options+=(!lto)
  fi

  if [[ "${_build_git::1}" != "t" ]]; then
    _main_stable
  else
    _main_git
  fi

  _source_dolphin_emu
}

# stable package
_main_stable() {
  :
}

# git package
_main_git() {
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

  _pkgsrc="$_pkgname"
  source=("$_pkgname"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags --abbrev=7 | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
  }
}

# submodules
_source_dolphin_emu() {
  source+=(
    #'bylaws.libadrenotools'::'git+https://github.com/bylaws/libadrenotools.git'
    #'curl'::'git+https://github.com/curl/curl.git'
    'cyan4973.xxhash'::'git+https://github.com/Cyan4973/xxHash.git'
    #'dolphin-emu.ext-win-ffmpeg'::'git+https://github.com/dolphin-emu/ext-win-ffmpeg.git'
    #'dolphin-emu.ext-win-qt'::'git+https://github.com/dolphin-emu/ext-win-qt.git'
    'epezent.implot'::'git+https://github.com/epezent/implot.git'
    #'fmtlib.fmt'::'git+https://github.com/fmtlib/fmt.git'
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
    #'mozilla.cubeb'::'git+https://github.com/mozilla/cubeb.git'
    #'randy408.libspng'::'git+https://github.com/randy408/libspng.git'
    'retroachievements.rcheevos'::'git+https://github.com/RetroAchievements/rcheevos.git'
    'syoyo.tinygltf'::'git+https://github.com/syoyo/tinygltf.git'
    'zlib-ng'::'git+https://github.com/zlib-ng/zlib-ng.git'
    'zlib-ng.minizip-ng'::'git+https://github.com/zlib-ng/minizip-ng.git'
  )
  sha256sums+=(
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

  _prepare_dolphin_emu() (
    cd "$_pkgsrc"
    local _submodules=(
      #'bylaws.libadrenotools'::'Externals/libadrenotools'
      #'curl'::'Externals/curl/curl'
      'cyan4973.xxhash'::'Externals/xxhash/xxHash'
      #'dolphin-emu.ext-win-ffmpeg'::'Externals/FFmpeg-bin'
      #'dolphin-emu.ext-win-qt'::'Externals/Qt'
      'epezent.implot'::'Externals/implot/implot'
      #'fmtlib.fmt'::'Externals/fmt/fmt'
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
      #'mozilla.cubeb'::'Externals/cubeb/cubeb'
      #'randy408.libspng'::'Externals/libspng/libspng'
      'retroachievements.rcheevos'::'Externals/rcheevos/rcheevos'
      'syoyo.tinygltf'::'Externals/tinygltf/tinygltf'
      'zlib-ng'::'Externals/zlib-ng/zlib-ng'
      'zlib-ng.minizip-ng'::'Externals/minizip-ng/minizip-ng'
    )
    _submodule_update
  )
}

# common functions
prepare() {
  _submodule_update() {
    local _module
    for _module in "${_submodules[@]}"; do
      git submodule init "${_module##*::}"
      git submodule set-url "${_module##*::}" "$srcdir/${_module%::*}"
      git -c protocol.file.allow=always submodule update "${_module##*::}"
    done
  }

  _prepare_dolphin_emu

  # Delete gcc specific options
  sed '/_ARCHIVE_/d' -i "$srcdir/$_pkgsrc/CMakeLists.txt"
}

build() {
  # Fix version string
  local _pkgver=$(pkgver)
  sed -Ez \
    -e 's@\n\s+execute_process\([^\(\)]+\bdescribe [^\(\)]*--dirty\b[^\(\)]+\)@\n\nset(DOLPHIN_WC_DESCRIBE "'"${_pkgver:?}"'")@' \
    -i "$srcdir/$_pkgsrc/CMake/ScmRevGen.cmake"

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DDISTRIBUTOR='aur.archlinux.org'

    -DENABLE_AUTOUPDATE=OFF
    # -DENABLE_ANALYTICS=OFF # default:Opt-in
    # -DUSE_SYSTEM_LIBS=ON # default:AUTO

    -DUSE_SYSTEM_ENET=OFF
    -DUSE_SYSTEM_LIBMGBA=OFF
    -DUSE_SYSTEM_MINIZIP=OFF
    -DUSE_SYSTEM_XXHASH=OFF
    -DUSE_SYSTEM_ZLIB=OFF
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
    export CC CXX LDFLAGS
    CC=clang
    CXX=clang++
    LDFLAGS="$(echo "$LDFLAGS" | sed -E 's@-fuse-ld=\S+\s*@ @g;s@\s+@ @g') -fuse-ld=lld"

    _cmake_options+=(
      -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON
      -DENABLE_LTO=ON
    )
  else
    _cmake_options+=(-DENABLE_LTO=OFF)
  fi

  if [[ "${_build_avx::1}" == "t" ]]; then
    export CFLAGS CXXFLAGS
    CFLAGS="$(echo "$CFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
    CXXFLAGS="$(echo "$CXXFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
  fi

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir/$_pkgsrc/Data/51-usb-device.rules" \
    -t "$pkgdir/usr/lib/udev/rules.d/"

  rm -rf "$pkgdir"/usr/{include,lib/libdiscord-rpc.a}
}

# execute
_main_package
