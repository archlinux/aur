# Maintainer: xiota / aur.chaotic.cx
# Contributor: Kerrick Staley <kerrick@kerrickstaley.com>
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jeremy Newton (Mystro256) <alexjnewt@gmail.com>

: ${_debugfast:=false}

_pkgname="dolphin-emu"
pkgname="$_pkgname-debugfast-git"
pkgver=5.0.r20303.gec69ed2173
pkgrel=1
pkgdesc='A Gamecube / Wii / Triforce emulator'
arch=(x86_64)
url="https://dolphin-emu.org"
license=(GPL2)
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
  #zlib-ng
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
  # normal package
  :
else
  # git package
  url="https://github.com/dolphin-emu/dolphin"

  provides=("$_pkgname")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source=("$_pkgname"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
  }
fi

_source_dolphin_emu() {
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

    'zlib-ng'::'git+https://github.com/zlib-ng/zlib-ng.git'

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

      ['epezent.implot']='Externals/implot/implot'
      ['gpuopen-librariesandsdks.vulkanmemoryallocator']='Externals/VulkanMemoryAllocator'
      ['mgba-emu.mgba']='Externals/mGBA/mgba'
      ['retroachievements.rcheevos']='Externals/rcheevos/rcheevos'
      ['zlib-ng']='Externals/zlib-ng/zlib-ng'
    )
    _submodule_update
  )
}

_submodule_update() {
  for key in ${!_submodules[@]} ; do
    git submodule init "${_submodules[${key}]}"
    git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
    git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
  done
}

_source_dolphin_emu

prepare() {
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
