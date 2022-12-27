# Maintainer: Snowstorm64

pkgname=ares-emu
pkgver=131
pkgrel=1
pkgdesc="Multi-system emulator by Near with experimental Nintendo 64 and PlayStation support"
arch=(x86_64 i686)
url="https://ares-emu.net/"
license=("ISC")
depends=(gtk3 gtksourceview3 libao libgl libpulse libudev.so=1-64 libxv openal sdl2 vulkan-driver vulkan-icd-loader)
makedepends=(mesa git)
provides=(ares-emu)
conflicts=(ares-emu)
source=("https://github.com/higan-emu/ares/archive/refs/tags/v${pkgver}.tar.gz"
        "ares-paths.patch")
sha256sums=("6156c2c336b1668a886136f55c6c88f20a412c2509d1824d78f64c1437b40e20"
        "39ed148f2cdd2bc0afde9da6a03d752ed247e731dc6257ffef9e088ffd8c28db")

prepare() {
  # Replace the placeholder with pkgver to automatically point at the source folder
  sed -i "s/PLACEHOLDER/${pkgver}/g" "${srcdir}/ares-paths.patch"

  # Patch Ares so that it can look for its files that are installed system-wide here
  patch -Np1 -i "${srcdir}/ares-paths.patch"
}

build() {
  make -C "${srcdir}/ares-${pkgver}/desktop-ui" hiro=gtk3
}

package() {
  install -Dm 644 "${srcdir}/ares-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 755 "${srcdir}/ares-${pkgver}/desktop-ui/out/ares" -t "${pkgdir}/usr/bin/"
  install -Dm 644 "${srcdir}/ares-${pkgver}/desktop-ui/resource/ares.png" -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"
  install -Dm 644 "${srcdir}/ares-${pkgver}/desktop-ui/resource/ares.desktop" -t "${pkgdir}/usr/share/applications/"

  # Also install the shaders in Ares' shared directory
  install -dm 755 "${pkgdir}/usr/share/ares"
  cp -dr --no-preserve=ownership "${srcdir}/ares-${pkgver}/ares/Shaders/" "${pkgdir}/usr/share/ares/Shaders/"
}
