# Maintainer: Snowstorm64

pkgname=ares-emu
pkgver=132
pkgrel=3
pkgdesc="Multi-system emulator by Near with experimental Nintendo 64 and PlayStation support"
arch=(x86_64 i686)
url="https://ares-emu.net/"
license=("ISC")
depends=(gtk3 libao libgl libpulse libudev.so=1-64 libxv openal sdl2 vulkan-driver vulkan-icd-loader)
makedepends=(mesa git)
provides=(ares-emu)
conflicts=(ares-emu)
source=("https://github.com/ares-emulator/ares/archive/refs/tags/v${pkgver}.tar.gz"
        "ares-paths.patch"
        "fix-build.patch")
sha256sums=("d66ed6af17fb92579ab6224bbaba9494e9841e97e032b0b42b128df72ea21d1c"
        "de3383a1bd6684b5acbded48332f9cc9725eff6e39dc9d29f080c7c32dbfa770"
        "b86020263291bd239ac5e231d6abe27f1857e66ba3d7f7bda64ae462558bb382")

prepare() {
  # Replace the placeholder with pkgver to automatically point at the source folder
  sed -i "s/PLACEHOLDER/${pkgver}/g" "${srcdir}/ares-paths.patch"

  # Patch Ares so that it can look for its files that are installed system-wide here
  patch -Np1 -i "${srcdir}/ares-paths.patch"

  # TODO: Only for v132, remove with next release
  sed -i "s/PLACEHOLDER/${pkgver}/g" "${srcdir}/fix-build.patch"
  patch -Np1 -i "${srcdir}/fix-build.patch"

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

  # And the database
  cp -dr --no-preserve=ownership "${srcdir}/ares-${pkgver}/mia/Database/" "${pkgdir}/usr/share/ares/Database/"
}
