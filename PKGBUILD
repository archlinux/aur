# Maintainer: Snowstorm64

pkgname=ares-emu-git
pkgver=141.r50.ga2400ad43
pkgrel=1
pkgdesc="Cross-platform, open source, multi-system emulator by Near and Ares team, focusing on accuracy and preservation. (git version)"
arch=("x86_64" "i686" "aarch64")
url="https://ares-emu.net/"
license=("ISC")
depends=("alsa-lib" "gcc-libs" "libao" "libgl" "libpulse" "librashader>=0.5.1-1"
  "libretro-shaders" "libudev.so=1-64" "libx11" "libxrandr" "openal" "sdl2"
  "vulkan-driver" "vulkan-icd-loader" "zlib" "cairo" "gdk-pixbuf2" "glib2"
  "glibc" "gtk3" "hicolor-icon-theme" "pango")
makedepends=("clang" "cmake" "git" "lld" "mesa" "ninja" "pkgconf")
provides=("ares-emu")
conflicts=("ares-emu")
install=ares.install
source=("git+https://github.com/ares-emulator/ares.git")
sha256sums=("SKIP")

pkgver() {
  cd "ares"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local cmake_options=(
    -B "build"
    -S "ares"
    -Wno-dev
    -DCMAKE_BUILD_TYPE="RelWithDebInfo"
    -DCMAKE_INSTALL_PREFIX="/usr"
    -DCMAKE_C_COMPILER="clang"
    -DCMAKE_CXX_COMPILER="clang++"
    -DCMAKE_C_FLAGS="${CFLAGS}"
    -DCMAKE_CXX_FLAGS="${CXXFLAGS}"
    -DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS}"
    -DENABLE_CCACHE=OFF
    -DARES_BUNDLE_SHADERS=OFF
    -DARES_SKIP_DEPS=ON
    -G Ninja
    )
  cmake "${cmake_options[@]}"
  cmake --build "build" -- $(echo ${MAKEFLAGS} | grep -oE -- '-j[0-9]+')
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build"
  install -Dm 644 "ares/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
