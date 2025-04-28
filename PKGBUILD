# Maintainer: Snowstorm64

pkgname=ares-emu
pkgver=144
pkgrel=1
pkgdesc="Cross-platform, open source, multi-system emulator by Near and Ares team, focusing on accuracy and preservation."
arch=("x86_64" "i686" "aarch64")
url="https://ares-emu.net/"
license=("ISC")
depends=("alsa-lib" "gcc-libs" "libao" "libgl" "libpulse" "librashader>=0.5.1-1"
  "libretro-shaders" "libudev.so=1-64" "libx11" "libxrandr" "openal" "sdl3"
  "vulkan-driver" "vulkan-icd-loader" "zlib" "cairo" "gdk-pixbuf2" "glib2"
  "glibc" "gtk3" "hicolor-icon-theme" "pango")
makedepends=("cmake" "mesa" "ninja" "pkgconf")
provides=("ares-emu")
conflicts=("ares-emu")
install="ares.install"
source=("https://github.com/ares-emulator/ares/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("2258bfa61a64d847b7d59f868a8b4cc948b35e71b4c27c66867d1622c1ffca9a7f3c079a2e0050467f60ff1eb3a20e9e4eb0a9f00ae0b7871ccbabd4c3ec31a2")

build() {
  local cmake_options=(
    -B "build"
    -S "ares-${pkgver}"
    -W no-dev
    -D CMAKE_BUILD_TYPE="None"
    -D CMAKE_INSTALL_PREFIX="/usr"
    -D ARES_BUILD_LOCAL=OFF
    -D ARES_BUNDLE_SHADERS=OFF
    -D ARES_SKIP_DEPS=ON
    -D ARES_VERSION_OVERRIDE="v${pkgver}"
    -G Ninja
    --fresh
    )
  cmake "${cmake_options[@]}"
  cmake --build "build"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build"
  install -Dm 644 "ares-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
