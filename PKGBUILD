# Maintainer: Snowstorm64

pkgname=ares-emu
pkgver=119
pkgrel=2
pkgdesc="Multi-system emulator by Near with experimental Nintendo 64 and PlayStation support"
arch=(x86_64 i686)
url="https://ares.dev/"
license=(CCPL:BY-NC-ND-4.0)
depends=(gtk3 gtksourceview3 libao libgl libpulse libudev.so=1-64 libxv openal sdl2 vulkan-driver vulkan-icd-loader)
makedepends=(mesa)
provides=(ares-emu)
conflicts=(ares-emu)
source=("https://ares.dev/downloads/ares_v119-source.zip"
        "LICENSE"
        "ares-paths.patch")
sha256sums=("a61e15acee8bb84107d1eccea53b6d8c23ee34d902c01c53d3b4e55a20996771"
        "9a91bcfb10df8dfdf02375d9015064de3d20faf251b456caf6760e73a7f4e466"
        "99e0ea0b33f6f3583c27e2ebbb8a7b1b482da19527d9f3e61c2dc26e9e345d71")

prepare() {
  patch -Np1 -i "${srcdir}/ares-paths.patch"
}

build() {
  cd "ares_v${pkgver}/lucia"
  make hiro=gtk3
}

package() {
  # There's no license file in the original package, so we have to add it manually
  install -Dm 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # Lucia is the simple user interface for Ares
  install -Dm 755 "ares_v${pkgver}/lucia/out/lucia" -t "${pkgdir}/usr/bin/"
  install -Dm 644 "ares_v${pkgver}/lucia/resource/lucia.png" -t "${pkgdir}/usr/share/icons/"
  
  sed -i "s/Name=lucia/Name=Ares (Lucia)/" "ares_v${pkgver}/lucia/resource/lucia.desktop"
  install -Dm 644 "ares_v${pkgver}/lucia/resource/lucia.desktop" -t "${pkgdir}/usr/share/applications/"  

  # Also install the shaders for Ares
  install -dm 755 "${pkgdir}/usr/share/ares"
  cp -dr --no-preserve=ownership "ares_v${pkgver}/ares/Shaders/" "${pkgdir}/usr/share/ares/Shaders/"
}
