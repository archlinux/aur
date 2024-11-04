# Maintainer: Snowstorm64

pkgname=ares-emu
pkgver=141
pkgrel=1
pkgdesc="Cross-platform, open source, multi-system emulator by Near and Ares team, focusing on accuracy and preservation."
arch=("x86_64" "i686")
url="https://ares-emu.net/"
license=("ISC")
depends=("gtk3" "libao" "libgl" "libpulse" "librashader>=0.5.1-1" "libudev.so=1-64" "libxv" "openal" "sdl2" "vulkan-driver" "vulkan-icd-loader")
makedepends=("mesa" "git" "clang" "lld")
provides=("ares-emu")
conflicts=("ares-emu")
install="ares.install"
source=("https://github.com/ares-emulator/ares/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("b9fab771b83cb320cbfe9880d9c1d837edcafbeb73a833ccd4752e461f3e2b3ee295a44a84ed63f8bd35436578bfff3ee8c35e155e0b671cf62e0f8d2de4f873")

build() {
  # If you want to build with gcc, edit to use g++ instead of clang++
  make ${MAKEFLAGS} -C "${srcdir}/ares-${pkgver}/desktop-ui" hiro=gtk3 compiler=clang++ prefix="/usr"
}

package() {
  install -Dm 644 "${srcdir}/ares-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 755 "${srcdir}/ares-${pkgver}/desktop-ui/out/ares" -t "${pkgdir}/usr/bin/"
  install -Dm 644 "${srcdir}/ares-${pkgver}/desktop-ui/resource/ares.png" -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"
  install -Dm 644 "${srcdir}/ares-${pkgver}/desktop-ui/resource/ares.desktop" -t "${pkgdir}/usr/share/applications/"

  # Also install shaders and databases in Ares' shared data directory
  install -dm 755 "${pkgdir}/usr/share/ares"
  cp -dr --no-preserve=ownership "${srcdir}/ares-${pkgver}/thirdparty/slang-shaders/" "${pkgdir}/usr/share/ares/Shaders/"
  cp -dr --no-preserve=ownership "${srcdir}/ares-${pkgver}/mia/Database/" "${pkgdir}/usr/share/ares/Database/"
}
