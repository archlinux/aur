# Maintainer: Snowstorm64

pkgname=ares-emu-git
pkgver=131.r29.gd40b890d8
pkgrel=1
pkgdesc="Multi-system emulator by Near with experimental Nintendo 64 and PlayStation support. (git version)"
arch=(x86_64 i686)
url="https://ares-emu.net/"
license=("ISC")
depends=(gtk3 libao libgl libpulse libudev.so=1-64 libxv openal sdl2 vulkan-driver vulkan-icd-loader)
makedepends=(mesa git)
provides=(ares-emu)
conflicts=(ares-emu)
source=("git+https://github.com/ares-emulator/ares.git"
        "ares-paths.patch")
sha256sums=("SKIP"
           "5805cfea308e46b0a209613d4693f3bb15ebb750436fc80d478437e464b6bf52")

pkgver() {
  cd "${srcdir}/ares"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # Patch Ares so that it can look for its files that are installed system-wide here
  patch -Np1 -i "${srcdir}/ares-paths.patch"
}

build() {
  make -C "${srcdir}/ares/desktop-ui" hiro=gtk3
}

package() {
  install -Dm 644 "${srcdir}/ares/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 755 "${srcdir}/ares/desktop-ui/out/ares" -t "${pkgdir}/usr/bin/"
  install -Dm 644 "${srcdir}/ares/desktop-ui/resource/ares.png" -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"
  install -Dm 644 "${srcdir}/ares/desktop-ui/resource/ares.desktop" -t "${pkgdir}/usr/share/applications/"

  # Also install the shaders in Ares' shared directory
  install -dm 755 "${pkgdir}/usr/share/ares"
  cp -dr --no-preserve=ownership "${srcdir}/ares/ares/Shaders/" "${pkgdir}/usr/share/ares/Shaders/"
}
