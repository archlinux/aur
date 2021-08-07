# Maintainer: Snowstorm64

pkgname=ares-emu-git
pkgver=v121a.r47.g409ea8d7c
pkgrel=1
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
           "71fcc3a8ad81107c025545c39a9f972f80b0d7096739f54b1004a2b58704b2ee")

pkgver() {
  cd "${srcdir}/ares"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  # Patch Ares so that it can look for its files that are installed system-wide here
  # With v123 lucia has been changed to ares, so we rename any user folder named lucia, to ares.
  patch -Np1 -i "${srcdir}/ares-paths.patch"
}

build() {
  make -C "${srcdir}/ares/desktop-ui" hiro=gtk3
}

package() {
  install -Dm 644 "${srcdir}/ares/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 755 "${srcdir}/ares/desktop-ui/out/ares" -t "${pkgdir}/usr/bin/"
  install -Dm 644 "${srcdir}/ares/desktop-ui/resource/ares.png" -t "${pkgdir}/usr/share/icons/"
  install -Dm 644 "${srcdir}/ares/desktop-ui/resource/ares.desktop" -t "${pkgdir}/usr/share/applications/"

  # Also install the shaders in Ares' shared directory
  install -dm 755 "${pkgdir}/usr/share/ares"
  cp -dr --no-preserve=ownership "${srcdir}/ares/ares/Shaders/" "${pkgdir}/usr/share/ares/Shaders/"
}
