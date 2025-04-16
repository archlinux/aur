# Maintainer: Snowstorm64

pkgname=ares-emu-git
pkgver=143.r72.ga247271e3
pkgrel=1
pkgdesc="Cross-platform, open source, multi-system emulator by Near and Ares team, focusing on accuracy and preservation. (git version)"
arch=("x86_64" "i686" "aarch64")
url="https://ares-emu.net/"
license=("ISC")
depends=("alsa-lib" "gcc-libs" "libao" "libgl" "libpulse" "librashader>=0.5.1-1"
  "libretro-shaders" "libudev.so=1-64" "libx11" "libxrandr" "openal" "sdl3"
  "vulkan-driver" "vulkan-icd-loader" "zlib" "cairo" "gdk-pixbuf2" "glib2"
  "glibc" "gtk3" "hicolor-icon-theme" "pango")
makedepends=("cmake" "git" "mesa" "ninja" "pkgconf")
provides=("ares-emu")
conflicts=("ares-emu")
install=ares.install
source=("git+https://github.com/ares-emulator/ares.git")
sha256sums=("SKIP")

pkgver() {
  cd "ares"
  git describe --long --tags --exclude=nightly | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local cmake_options=(
    -B "build"
    -S "ares"
    -W no-dev
    -D CMAKE_BUILD_TYPE="None"
    -D CMAKE_INSTALL_PREFIX="/usr"
    -D ARES_BUILD_LOCAL=OFF
    -D ARES_BUNDLE_SHADERS=OFF
    -D ARES_SKIP_DEPS=ON
    -G Ninja
    )
  cmake "${cmake_options[@]}"
  cmake --build "build"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build"
  install -Dm 644 "ares/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
