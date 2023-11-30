# Maintainer: xiota / aur.chaotic.cx
# Contributor: Kerrick Staley <kerrick@kerrickstaley.com>
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jeremy Newton (Mystro256) <alexjnewt@gmail.com>

# options
: ${_debugfast:=false}
: ${_system_zlib:=false}

: ${_avx_build:=false}
: ${_pkgtype:=debugfast-git}


if [[ x"${_avx_build::1}" == "xt" ]] ; then
  if [ x"${_pkgtype: -4}" == "x-git" ] ; then
    _pkgtype="${_pkgtype%-*}-avx-${_pkgtype##*-}"
  else
    _pkgtype+="-avx"
  fi
fi

# basic info
_pkgname="dolphin-emu"
pkgname="$_pkgname${_pkgtype:+-$_pkgtype}"
pkgver=5.0.r20495.g89963c287c
pkgrel=1
pkgdesc='A Gamecube / Wii / Triforce emulator'
arch=(x86_64)
_url="https://github.com/dolphin-emu/dolphin"
url="https://dolphin-emu.org"
license=(GPL2)

# main package
_main_package() {
  depends=(
    # extra/dolphin-emu
    alsa-lib
    bluez-libs
    enet
    gcc-libs
    glibc
    hidapi
    libavcodec.so
    libavformat.so
    libavutil.so
    libcurl.so
    libevdev
    libgl
    libminiupnpc.so
    libpulse
    libsfml-network.so
    libsfml-system.so
    libswscale.so
    libudev.so
    libusb-1.0.so
    libx11
    libxi
    libxrandr
    lzo
    minizip-ng
    pugixml
    qt6-base
    qt6-svg
    sfml

    ## dolphin-emu-git
    #libmgba
    cubeb
    fmt
    libspng
    mbedtls2
  )
  makedepends+=(
    cmake
    git
    ninja
    python
  )
  optdepends=(
    'pulseaudio: PulseAudio backend'
  )

  options=(!emptydirs !lto)

  if [ x"$pkgname" == x"$_pkgname" ] ; then
    _main_stable
  else
    _main_git
  fi

  _source_dolphin_emu
}

# submodules
_source_dolphin_emu() {
  if [ x"${_system_zlib::1}" == "xt" ] ; then
    depends+=(zlib-ng)
  else
    source+=('zlib-ng'::'git+https://github.com/zlib-ng/zlib-ng.git')
    sha256sums+=('SKIP')
  fi

  source+=(
    #'bylaws.libadrenotools'::'git+https://github.com/bylaws/libadrenotools.git'
    #'curl'::'git+https://github.com/curl/curl.git'
    #'dolphin-emu.ext-win-ffmpeg'::'git+https://github.com/dolphin-emu/ext-win-ffmpeg.git'
    #'dolphin-emu.ext-win-qt'::'git+https://github.com/dolphin-emu/ext-win-qt.git'
    #'fmtlib.fmt'::'git+https://github.com/fmtlib/fmt.git'
    #'google.googletest'::'git+https://github.com/google/googletest.git'
    #'khronosgroup.spirv-cross'::'git+https://github.com/KhronosGroup/SPIRV-Cross.git'
    #'libsdl-org.sdl'::'git+https://github.com/libsdl-org/SDL.git'
    #'libusb'::'git+https://github.com/libusb/libusb.git'
    #'lz4'::'git+https://github.com/lz4/lz4.git'
    #'mozilla.cubeb'::'git+https://github.com/mozilla/cubeb.git'
    #'randy408.libspng'::'git+https://github.com/randy408/libspng.git'

    'cyan4973.xxhash'::'git+https://github.com/Cyan4973/xxHash.git'
    'epezent.implot'::'git+https://github.com/epezent/implot.git'
    'gpuopen-librariesandsdks.vulkanmemoryallocator'::'git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git'
    'mgba-emu.mgba'::'git+https://github.com/mgba-emu/mgba.git'
    'retroachievements.rcheevos'::'git+https://github.com/RetroAchievements/rcheevos.git'
  )
  sha256sums+=(
    #'SKIP'
    #'SKIP'
    #'SKIP'
    #'SKIP'
    #'SKIP'
    #'SKIP'
    #'SKIP'
    #'SKIP'
    #'SKIP'
    #'SKIP'
    #'SKIP'
    #'SKIP'

    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
  )

  _prepare_dolphin_emu() (
    cd "${srcdir:?}/$_pkgsrc"
    local -A _submodules=(
      #['bylaws.libadrenotools']='Externals/libadrenotools'
      #['curl']='Externals/curl/curl'
      #['dolphin-emu.ext-win-ffmpeg']='Externals/FFmpeg-bin'
      #['dolphin-emu.ext-win-qt']='Externals/Qt'
      #['fmtlib.fmt']='Externals/fmt/fmt'
      #['google.googletest']='Externals/gtest'
      #['khronosgroup.spirv-cross']='Externals/spirv_cross/SPIRV-Cross'
      #['libsdl-org.sdl']='Externals/SDL/SDL'
      #['libusb']='Externals/libusb/libusb'
      #['lz4']='Externals/lz4/lz4'
      #['mozilla.cubeb']='Externals/cubeb/cubeb'
      #['randy408.libspng']='Externals/libspng/libspng'

      ['cyan4973.xxhash']='Externals/xxhash/xxHash'
      ['epezent.implot']='Externals/implot/implot'
      ['gpuopen-librariesandsdks.vulkanmemoryallocator']='Externals/VulkanMemoryAllocator'
      ['mgba-emu.mgba']='Externals/mGBA/mgba'
      ['retroachievements.rcheevos']='Externals/rcheevos/rcheevos'
    )

    if [ x"${_system_zlib::1}" != "xt" ] ; then
      _submodules+=(
        ['zlib-ng']='Externals/zlib-ng/zlib-ng'
      )
    fi

    _submodule_update
  )
}

# stable package
_main_stable() {
  :
}

# git package
_main_git() {
  url="${_url:?}"

  provides=("$_pkgname")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source=("$_pkgname"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
  }
}

# common functions
prepare() {
  _submodule_update() {
    for key in ${!_submodules[@]} ; do
      git submodule init "${_submodules[${key}]}"
      git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
      git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
    done
  }

  _prepare_dolphin_emu

  # Fix version string
  local _pkgver=$(pkgver)
  sed -Ez \
    -e 's@\n\s+execute_process\([^\(\)]+\bdescribe [^\(\)]*--dirty\b[^\(\)]+\)@\n\nset(DOLPHIN_WC_DESCRIBE "'"${_pkgver:?}"'")@' \
    -i "${srcdir:?}/$_pkgsrc/CMake/ScmRevGen.cmake"

  # Fix minizip-ng name for Arch
  sed -E -e 's@(pkgconfig\(MINIZIP minizip)([^a-z]+)@\1-ng\2@' \
    -i "${srcdir:?}/$_pkgsrc/CMakeLists.txt"
}

build() {
  if [ x"${_system_zlib::1}" == "xt" ] ; then
    export LDFLAGS="-Wl,--copy-dt-needed-entries"
  fi

  if [[ x"${_avx_build::1}" == "xt" ]] ; then
    export CFLAGS="$(echo "$CFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=skylake -O3"
    export CXXFLAGS="$(echo "$CFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=skylake -O3"
  fi

  local _cmake_options=(
    -B build
    -S "$_pkgname"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DDISTRIBUTOR='aur.chaotic.cx'
    -DENABLE_AUTOUPDATE=OFF
    # -DENABLE_ANALYTICS=OFF # ON is opt-in
    # -DUSE_SYSTEM_LIBS=ON # AUTO
    -DUSE_SYSTEM_LIBMGBA=OFF

    -DENABLE_LTO=OFF # segfault when on
    -DENABLE_TESTS=OFF
    -Wno-dev
  )

  if [ x"${_debugfast::1}" == "xt" ] ; then
    _cmake_options+=(-DFASTLOG=ON)
  fi

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build

  install -Dm644 "${srcdir:?}/$_pkgsrc/Data/51-usb-device.rules" \
    -t "${pkgdir:?}/usr/lib/udev/rules.d/"

  rm -rf "${pkgdir:?}"/usr/{include,lib/libdiscord-rpc.a}
}

# execute
_main_package
