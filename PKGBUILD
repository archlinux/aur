# Maintainer: Snowstorm64

pkgname=ares-emu
pkgver=118
pkgrel=2
pkgdesc="Multi-system emulator by Near with experimental Nintendo 64 and PlayStation support"
arch=(x86_64 i686)
url="https://ares.dev/"
license=(CCPL:BY-NC-ND-4.0)
depends=(gtk3 gtksourceview3 libao libgl libpulse libudev.so=1-64 libxv openal sdl2 vulkan-driver vulkan-icd-loader)
makedepends=(mesa)
provides=(ares-emu)
conflicts=(ares-emu)
source=("https://ares.dev/downloads/ares_v118-source.zip"
        "LICENSE"
        "ares-paths.patch")
sha256sums=('563c7d4304570091370da3c8183dd69526da00aa917b1391667636e95da9d360'
        "9a91bcfb10df8dfdf02375d9015064de3d20faf251b456caf6760e73a7f4e466"
        "24863b59c880b34703a5b06e90f0ebf2087a186858b0b3ef4de5c09a36489ea3")

prepare() {
  patch -Np1 -i "${srcdir}/ares-paths.patch"
}

build() {
  cd "ares/lucia"
  make hiro=gtk3
}

package() {
  # There's no license file in the original package, so we have to add it manually
  install -Dm 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # Lucia is the simple user interface for Ares
  install -Dm 755 "ares/lucia/out/lucia" -t "${pkgdir}/usr/bin/"
  install -Dm 644 "ares/lucia/resource/lucia.png" -t "${pkgdir}/usr/share/icons/"
  
  sed -i "s/Name=lucia/Name=Ares (Lucia)/" "ares/lucia/resource/lucia.desktop"
  install -Dm 644 "ares/lucia/resource/lucia.desktop" -t "${pkgdir}/usr/share/applications/"  

  # Also install the shaders for Ares
  install -dm 755 "${pkgdir}/usr/share/ares"
  cp -dr --no-preserve=ownership "ares/ares/Shaders/" "${pkgdir}/usr/share/ares/Shaders/"
}

