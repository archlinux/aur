# Maintainer: Snowstorm64

pkgname=ares-emu-git
pkgver=133.r30.g9fb87dc0c
pkgrel=1
pkgdesc="Cross-platform, open source, multi-system emulator by Near and Ares team, focusing on accuracy and preservation. (git version)"
arch=(x86_64 i686)
url="https://ares-emu.net/"
license=("ISC")
depends=(gtk3 libao libgl libpulse libudev.so=1-64 libxv openal sdl2 vulkan-driver vulkan-icd-loader)
makedepends=(mesa git clang lld)
provides=(ares-emu)
conflicts=(ares-emu)
install=ares.install
source=("git+https://github.com/ares-emulator/ares.git"
        "ares-paths.patch")
sha256sums=("SKIP"
           "60e6c9424680a16868098721a8238c8407a0e1a6cc5437a8306d36d66ec6a3ce")

pkgver() {
  cd "${srcdir}/ares"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # For time being patch Ares so that it copies settings.bml, if applicable, from old location to default location
  patch -Np1 -i "${srcdir}/ares-paths.patch"
}

build() {
  # If you want to build with gcc, edit to use g++ instead of clang++
  make -C "${srcdir}/ares/desktop-ui" hiro=gtk3 compiler=clang++
}

package() {
  install -Dm 644 "${srcdir}/ares/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 755 "${srcdir}/ares/desktop-ui/out/ares" -t "${pkgdir}/usr/bin/"
  install -Dm 644 "${srcdir}/ares/desktop-ui/resource/ares.png" -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"
  install -Dm 644 "${srcdir}/ares/desktop-ui/resource/ares.desktop" -t "${pkgdir}/usr/share/applications/"

  # Also install shaders and databases in Ares' shared data directory
  install -dm 755 "${pkgdir}/usr/share/ares"
  cp -dr --no-preserve=ownership "${srcdir}/ares/ares/Shaders/" "${pkgdir}/usr/share/ares/Shaders/"
  cp -dr --no-preserve=ownership "${srcdir}/ares/mia/Database/" "${pkgdir}/usr/share/ares/Database/"
}
