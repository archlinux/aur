# Maintainer: Snowstorm64

pkgname=ares-emu-git
pkgver=v121a.r1.g77110f15a
pkgrel=1
pkgdesc="Multi-system emulator by Near with experimental Nintendo 64 and PlayStation support. (git version)"
arch=(x86_64 i686)
url="https://ares.dev/"
license=("ISC")
depends=(gtk3 gtksourceview3 libao libgl libpulse libudev.so=1-64 libxv openal sdl2 vulkan-driver vulkan-icd-loader)
makedepends=(mesa)
provides=(ares-emu)
conflicts=(ares-emu)
source=("git+https://github.com/higan-emu/ares.git"
        "ares-paths.patch")
sha256sums=("SKIP"
           "ff3d8b06d2296ea9b48f5a83f070500161aad3638caae1633b203aa51e6b5f8b")

pkgver() {
  cd "${srcdir}/ares"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  patch -Np1 -i "${srcdir}/ares-paths.patch"
}

build() {
  cd "${srcdir}/ares/lucia"
  make hiro=gtk3
}

package() {
  # Install the license
  install -Dm 644 "${srcdir}/ares/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # Lucia is the simple user interface for Ares
  install -Dm 755 "${srcdir}/ares/lucia/out/lucia" -t "${pkgdir}/usr/bin/"
  install -Dm 644 "${srcdir}/ares/lucia/resource/lucia.png" -t "${pkgdir}/usr/share/icons/"
  
  sed -i "s/Name=lucia/Name=Ares (Lucia)/" "${srcdir}/ares/lucia/resource/lucia.desktop"
  install -Dm 644 "${srcdir}/ares/lucia/resource/lucia.desktop" -t "${pkgdir}/usr/share/applications/"

  # Also install the shaders for Ares
  install -dm 755 "${pkgdir}/usr/share/lucia"
  cp -dr --no-preserve=ownership "${srcdir}/ares/ares/Shaders/" "${pkgdir}/usr/share/lucia/Shaders/"
}
