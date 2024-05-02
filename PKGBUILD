# Maintainer: Snowstorm64

pkgname=ares-emu
pkgver=138
pkgrel=1
pkgdesc="Cross-platform, open source, multi-system emulator by Near and Ares team, focusing on accuracy and preservation."
arch=(x86_64 i686)
url="https://ares-emu.net/"
license=("ISC")
depends=(gtk3 libao libgl libpulse librashader libudev.so=1-64 libxv openal sdl2 vulkan-driver vulkan-icd-loader)
makedepends=(mesa git clang lld)
provides=(ares-emu)
conflicts=(ares-emu)
install=ares.install
source=("https://github.com/ares-emulator/ares/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("59f8f7992b9d7ed61e14b736c501f844e15806cee832bc386382e4a41c87a76835348b373b703fbe4dd84d883c7e140e5c54cf39a3acf23bc766cf94af04aa54")

build() {
  # If you want to build with gcc, edit to use g++ instead of clang++
  make -C "${srcdir}/ares-${pkgver}/desktop-ui" hiro=gtk3 compiler=clang++
}

package() {
  install -Dm 644 "${srcdir}/ares-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 755 "${srcdir}/ares-${pkgver}/desktop-ui/out/ares" -t "${pkgdir}/usr/bin/"
  install -Dm 644 "${srcdir}/ares-${pkgver}/desktop-ui/resource/ares.png" -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"
  install -Dm 644 "${srcdir}/ares-${pkgver}/desktop-ui/resource/ares.desktop" -t "${pkgdir}/usr/share/applications/"

  # Also install shaders and databases in Ares' shared data directory
  install -dm 755 "${pkgdir}/usr/share/ares"
  cp -dr --no-preserve=ownership "${srcdir}/ares-${pkgver}/thirdparty/slang-shaders/" "${pkgdir}/usr/share/ares/Shaders/"
  cp -dr --no-preserve=ownership "${srcdir}/ares-${pkgver}/mia/Database/" "${pkgdir}/usr/share/ares/Database/"
}
