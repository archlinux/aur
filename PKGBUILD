# Maintainer: Snowstorm64

pkgname=ares-emu
pkgver=147
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
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/ares-emulator/ares/releases/download/v${pkgver}/ares-source.tar.gz")
sha512sums=("c05521455b469c948500590b394339bfc751fac6a86461f378f21294aa7796d5ab346c1148d00379660ce341edc0f2652befe307083f5830c86e5fef6d5795ca")

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
