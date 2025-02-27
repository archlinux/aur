# Maintainer: Snowstorm64

pkgname=ares-emu
pkgver=143
pkgrel=2
pkgdesc="Cross-platform, open source, multi-system emulator by Near and Ares team, focusing on accuracy and preservation."
arch=("x86_64" "i686" "aarch64")
url="https://ares-emu.net/"
license=("ISC")
depends=("alsa-lib" "gcc-libs" "libao" "libgl" "libpulse" "librashader>=0.5.1-1"
  "libretro-shaders" "libudev.so=1-64" "libx11" "libxrandr" "openal" "sdl2"
  "vulkan-driver" "vulkan-icd-loader" "zlib" "cairo" "gdk-pixbuf2" "glib2"
  "glibc" "gtk3" "hicolor-icon-theme" "pango")
makedepends=("cmake" "mesa" "ninja" "pkgconf")
provides=("ares-emu")
conflicts=("ares-emu")
install="ares.install"
source=("https://github.com/ares-emulator/ares/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("3d231ee98b657190445ea2ae822f427a371e42ce0fcc7e2c886f01cc29c80b384761400375944b9b44a57383517353eb60e3dd96afdef4a9b29e3eb42877dde2")

prepare() {
  # Keep this until v144 release! This fixes a serious issue with v143
  sed -i "s/virtual auto saveName() -> string { return pak->attribute(\"name\"); }/virtual auto saveName() -> string { return name(); }/g" "${srcdir}/ares-143/mia/pak/pak.hpp"
}

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
