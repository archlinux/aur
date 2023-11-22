# Maintainer: Snowstorm64

pkgname=ares-emu
pkgver=134
pkgrel=1
pkgdesc="Cross-platform, open source, multi-system emulator by Near and Ares team, focusing on accuracy and preservation."
arch=(x86_64 i686)
url="https://ares-emu.net/"
license=("ISC")
depends=(gtk3 libao libgl libpulse libudev.so=1-64 libxv openal sdl2 vulkan-driver vulkan-icd-loader)
makedepends=(mesa git clang lld)
provides=(ares-emu)
conflicts=(ares-emu)
install=ares.install
source=("https://github.com/ares-emulator/ares/archive/refs/tags/v${pkgver}.tar.gz"
        "ares-paths.patch")
sha256sums=("52818af627a2e6dc3a373d168d2db85de74f43e231b40d7bcbd8cf4e062fd279"
        "c53722c8dcfe771b00396a8b02648d7c40e0d657ac4398d09c755cffcb425f1b")

prepare() {
  # Replace the placeholder with pkgver to automatically point at the source folder
  sed -i "s/PLACEHOLDER/${pkgver}/g" "${srcdir}/ares-paths.patch"

  # Patch Ares so that it can look for its files that are installed system-wide here
  patch -Np1 -i "${srcdir}/ares-paths.patch"
}

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
  cp -dr --no-preserve=ownership "${srcdir}/ares-${pkgver}/ares/Shaders/" "${pkgdir}/usr/share/ares/Shaders/"
  cp -dr --no-preserve=ownership "${srcdir}/ares-${pkgver}/mia/Database/" "${pkgdir}/usr/share/ares/Database/"
}
