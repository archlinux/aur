# Maintainer: Snowstorm64

pkgname=ares-emu
pkgver=140
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
sha512sums=("ede555acb596021b8f7a9ad25f8b38be8052da8380995baf6a24b5062ac6ff7235bee35406e613ac7d1dcea59bea65d7f1bef3264a603ddd65b1f4028740a4d9")

build() {
  # If you want to build with gcc, edit to use g++ instead of clang++
  make -C "${srcdir}/ares-${pkgver}/desktop-ui" hiro=gtk3 compiler=clang++ prefix="/usr"
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
