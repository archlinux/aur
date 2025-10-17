# Maintainer:
# Contributor: Nick Lay <layns(at)mail(dot)uc(dot)edu>

## options
: ${_build_clang:=false}

: ${_branch=primehack-aur}

_pkgname="dolphin-emu-primehack"
pkgname="$_pkgname-git"
pkgver=2509.r10.g060c588
pkgrel=1
pkgdesc="A Gamecube and Wii emulator with mouselook controls"
url="https://github.com/xiota/dolphin-primehack"
license=('GPL-2.0-or-later')
arch=('x86_64')

depends=(
  'alsa-lib'
  'bluez-libs'
  'bzip2'
  'hidapi'
  'libavcodec.so'  # ffmpeg
  'libavformat.so' # ffmpeg
  'libavutil.so'   # ffmpeg
  'libevdev'
  'libfmt.so'
  'libgl'
  'liblzma.so'
  'libpulse'
  'libspng'
  'libswscale.so' # ffmpeg
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
  'sdl3'
  'zstd'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'python'
  'vulkan-headers'
)

if [[ "${_build_clang::1}" == "t" ]]; then
  makedepends+=(
    clang
    lld
    llvm
  )
else
  options+=('!lto')
fi

provides=("$_pkgname")
conflicts=("$_pkgname")

options+=(!emptydirs)

_pkgsrc="xiota.primehack"
source=("$_pkgsrc"::"git+$url.git#branch=$_branch")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"
  git rm -r 'Externals/FFmpeg-bin'
  git rm -r 'Externals/Qt'
  git rm -r 'Externals/SDL/SDL'
  git rm -r 'Externals/Vulkan-Headers'
  git rm -r 'Externals/curl/curl'
  git rm -r 'Externals/fmt/fmt'
  git rm -r 'Externals/gtest'
  git rm -r 'Externals/hidapi/hidapi-src'
  git rm -r 'Externals/libadrenotools'
  git rm -r 'Externals/libspng/libspng'
  git rm -r 'Externals/libusb/libusb'
  git rm -r 'Externals/lz4/lz4'
  git rm -r 'Externals/miniupnpc/miniupnp'
  git rm -r 'Externals/spirv_cross/SPIRV-Cross'
  git submodule update --init --depth=1

  # Delete gcc specific options
  sed '/_ARCHIVE_/d' -i CMakeLists.txt

  # Fix for Qt 6.10
  sed -E -e '/COMPONENTS/s&\b(Widgets)\b&\1 GuiPrivate&' \
    -e '$ a target_link_libraries(dolphin-emu PRIVATE Qt6::GuiPrivate)' \
    -i Source/Core/DolphinQt/CMakeLists.txt
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() (
  export CC CXX CFLAGS CXXFLAGS LDFLAGS
  local _pkgver _cmake_options

  # Fix version string
  _pkgver=$(pkgver)
  install /dev/stdin "$srcdir/$_pkgsrc/Source/Core/Common/scmrev.h.in" << END
#define SCM_REV_STR "\${DOLPHIN_WC_REVISION}"
#define SCM_DESC_STR "${_pkgver:?}"
#define SCM_BRANCH_STR "$_branch"
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
    -DUSE_SYSTEM_FMT=ON
    -DUSE_SYSTEM_LIBMGBA=OFF
    -DUSE_SYSTEM_XXHASH=OFF
    -DENABLE_TESTS=OFF
    -Wno-dev
  )

  if [[ "${_build_clang::1}" == "t" ]]; then
    CC=clang
    CXX=clang++
    LDFLAGS="$(sed -E -e 's/\S*fuse-ld\S*//g' <<< "$LDFLAGS") -fuse-ld=lld"

    _cmake_options+=(
      -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON
      -DENABLE_LTO=ON
    )
  else
    _cmake_options+=(-DENABLE_LTO=OFF)
  fi

  cmake "${_cmake_options[@]}"
  cmake --build build
)

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir/$_pkgsrc/Data/51-usb-device.rules" \
    "$pkgdir/usr/lib/udev/rules.d/51-usb-device-primehack.rules"

  rm -rf "$pkgdir"/usr/{include,lib/libdiscord-rpc.a}
}
