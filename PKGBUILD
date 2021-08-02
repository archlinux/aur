# Maintainer: Snowstorm64

pkgname=ares-emu
pkgver=122
pkgrel=1
pkgdesc="Multi-system emulator by Near with experimental Nintendo 64 and PlayStation support"
arch=(x86_64 i686)
url="https://ares.dev/"
license=("ISC")
depends=(gtk3 gtksourceview3 libao libgl libpulse libudev.so=1-64 libxv openal sdl2 vulkan-driver vulkan-icd-loader)
makedepends=(mesa git)
provides=(ares-emu)
conflicts=(ares-emu)
source=("https://github.com/higan-emu/ares/archive/refs/tags/v${pkgver}.tar.gz"
        "ares-paths.patch")
sha256sums=("282153f320c8b66e8489e88740c338f096a87ef7ffe7e7268438241a6c12e65a"
        "3e177ddb419dd2363b29e39253ff6bb71143de5332616b1c056119cf06a88608")

prepare() {
  # Replace the placeholder with pkgver to automatically point at the source folder
  sed -i "s/PLACEHOLDER/${pkgver}/g" "${srcdir}/ares-paths.patch"

  # Patch Ares so that it can look for its files that are installed system-wide here
  patch -Np1 -i "${srcdir}/ares-paths.patch"
}

build() {
  # First download parallel-rdp from github, otherwise N64 emulation won't work.
  make -C "${srcdir}/ares-${pkgver}/ares/n64/vulkan" sync-upstream
  make -C "${srcdir}/ares-${pkgver}/lucia" hiro=gtk3
}

package() {
  # Install Ares' license in /usr/share/licenses
  install -Dm 644 "${srcdir}/ares-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # Lucia is the simple user interface for Ares
  install -Dm 755 "${srcdir}/ares-${pkgver}/lucia/out/lucia" -t "${pkgdir}/usr/bin/"
  install -Dm 644 "${srcdir}/ares-${pkgver}/lucia/resource/lucia.png" -t "${pkgdir}/usr/share/icons/"
  
  # It's commonly known as Ares, less so as Lucia, so specify that in .desktop file
  sed -i "s/Name=lucia/Name=Ares (Lucia)/" "${srcdir}/ares-${pkgver}/lucia/resource/lucia.desktop"
  install -Dm 644 "${srcdir}/ares-${pkgver}/lucia/resource/lucia.desktop" -t "${pkgdir}/usr/share/applications/"

  # Also install the shaders in Ares' shared directory
  install -dm 755 "${pkgdir}/usr/share/lucia"
  cp -dr --no-preserve=ownership "${srcdir}/ares-${pkgver}/ares/Shaders/" "${pkgdir}/usr/share/lucia/Shaders/"
}
