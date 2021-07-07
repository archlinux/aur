# Maintainer: Snowstorm64

pkgname=ares-emu-git
pkgver=v121a.r1.g77110f15a
pkgrel=5
pkgdesc="Multi-system emulator by Near with experimental Nintendo 64 and PlayStation support. (git version)"
arch=(x86_64 i686)
url="https://ares.dev/"
license=("ISC")
depends=(gtk3 gtksourceview3 libao libgl libpulse libudev.so=1-64 libxv openal sdl2 vulkan-driver vulkan-icd-loader)
makedepends=(mesa git)
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
  # Patch Ares so that it can look for its files that are installed system-wide here
  patch -Np1 -i "${srcdir}/ares-paths.patch"
}

build() {
  # Download first parallel-rdp from github, otherwise N64 emulation won't work.
  make -C "${srcdir}/ares/ares/n64/vulkan" sync-upstream
  make -C "${srcdir}/ares/lucia" hiro=gtk3
}

package() {
  # Install Ares' license in /usr/share/licenses
  install -Dm 644 "${srcdir}/ares/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # Lucia is the simple user interface for Ares
  install -Dm 755 "${srcdir}/ares/lucia/out/lucia" -t "${pkgdir}/usr/bin/"
  install -Dm 644 "${srcdir}/ares/lucia/resource/lucia.png" -t "${pkgdir}/usr/share/icons/"
  
  # It's commonly known as Ares, less so as Lucia, so specify that in .desktop file
  sed -i "s/Name=lucia/Name=Ares (Lucia)/" "${srcdir}/ares/lucia/resource/lucia.desktop"

  # Force XWayland if running on Wayland, because Ares currently isn't compatible with it.
  sed -i "s/Exec=lucia/Exec=env GDK_BACKEND=x11 lucia/" "${srcdir}/ares/lucia/resource/lucia.desktop"
  install -Dm 644 "${srcdir}/ares/lucia/resource/lucia.desktop" -t "${pkgdir}/usr/share/applications/"

  # Also install the shaders in Ares' shared directory
  install -dm 755 "${pkgdir}/usr/share/lucia"
  cp -dr --no-preserve=ownership "${srcdir}/ares/ares/Shaders/" "${pkgdir}/usr/share/lucia/Shaders/"
}
