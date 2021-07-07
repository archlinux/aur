# Maintainer: Snowstorm64

pkgname=ares-emu
pkgver=121a
pkgrel=1
pkgdesc="Multi-system emulator by Near with experimental Nintendo 64 and PlayStation support"
arch=(x86_64 i686)
url="https://ares.dev/"
license=("ISC")
depends=(gtk3 gtksourceview3 libao libgl libpulse libudev.so=1-64 libxv openal sdl2 vulkan-driver vulkan-icd-loader)
makedepends=(mesa)
provides=(ares-emu)
conflicts=(ares-emu)
source=("https://github.com/higan-emu/ares/archive/refs/tags/v121a.tar.gz"
        "ares-paths.patch")
sha256sums=("ee723ca63783b37da36bf4dce9c0cdea91f7a18145cbcc9fb98e0c91908a305f"
        "9d96572075ae4694a68d3a10a855de3223db28de90b51330f0c17cd2d0c7c6e6")

prepare() {
  # Replace the placeholder with _pkgver to automatically point at the source folder
  sed -i "s/PLACEHOLDER/${pkgver}/" "${srcdir}/ares-paths.patch"
  patch -Np1 -i "${srcdir}/ares-paths.patch"
}

build() {
  cd "ares-${pkgver}/lucia"
  make hiro=gtk3
}

package() {
  # There's no license file in the original package, so we have to add it manually
  install -Dm 644 "ares-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # Lucia is the simple user interface for Ares
  install -Dm 755 "ares-${pkgver}/lucia/out/lucia" -t "${pkgdir}/usr/bin/"
  install -Dm 644 "ares-${pkgver}/lucia/resource/lucia.png" -t "${pkgdir}/usr/share/icons/"
  
  sed -i "s/Name=lucia/Name=Ares (Lucia)/" "ares-${pkgver}/lucia/resource/lucia.desktop"
  install -Dm 644 "ares-${pkgver}/lucia/resource/lucia.desktop" -t "${pkgdir}/usr/share/applications/"

  # Also install the shaders for Ares
  install -dm 755 "${pkgdir}/usr/share/lucia"
  cp -dr --no-preserve=ownership "ares-${pkgver}/ares/Shaders/" "${pkgdir}/usr/share/lucia/Shaders/"
}
