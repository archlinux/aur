# Maintainer: Snowstorm64

pkgname=ares-emu
pkgver=121a
pkgrel=2
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
  sed -i "s/PLACEHOLDER/${pkgver}/g" "${srcdir}/ares-paths.patch"

  # Patch Ares so that it can look for its files that are installed system-wide here
  patch -Np1 -i "${srcdir}/ares-paths.patch"
}

build() {
  # Download first Vulkan based parallel-rdp from github, otherwise N64 emulation won't work.
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

  # Force XWayland if running Wayland, because Ares currently isn't compatible with it.
  sed -i "s/Exec=lucia/Exec=env GDK_BACKEND=x11 lucia/" "${srcdir}/ares-${pkgver}/lucia/resource/lucia.desktop"
  install -Dm 644 "${srcdir}/ares-${pkgver}/lucia/resource/lucia.desktop" -t "${pkgdir}/usr/share/applications/"

  # Also install the shaders in Ares's shared directory
  install -dm 755 "${pkgdir}/usr/share/lucia"
  cp -dr --no-preserve=ownership "${srcdir}/ares-${pkgver}/ares/Shaders/" "${pkgdir}/usr/share/lucia/Shaders/"
}
