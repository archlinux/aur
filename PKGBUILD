# Maintainer: Snowstorm64

pkgname=ares-emu
pkgver=146
pkgrel=2
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
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/ares-emulator/ares/releases/download/v${pkgver}/ares-source.tar.gz")
sha512sums=("62e5d6d34054403f469634b3c9c5d7db72b198aa8bae0c6f10ec1eb06d11b111152b026278441c0729896bdb3746cabe9d6f2628f5bc9c9827d7c4a975826cfa")

build() {
  local cmake_options=(
    -B "build"
    -W no-dev
    -D CMAKE_BUILD_TYPE="None"
    -D CMAKE_INSTALL_PREFIX="/usr"
    -D ARES_BUILD_LOCAL=OFF
    -D ARES_BUNDLE_SHADERS=OFF
    -D ARES_SKIP_DEPS=ON
    -D ARES_BUILD_OFFICIAL=YES
    -G Ninja
    --fresh
    )
  cmake "${cmake_options[@]}"
  cmake --build "build"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build"
  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
