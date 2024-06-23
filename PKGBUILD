# Past Maintainer: Corwin <corwin@kuiper.dev>
# Maintainer: Zion Nimchuk <zionnimchuk@gmail.com>
# Maintainer: Harrison <htv04rules at gmail dot com>

pkgname=melonds
pkgver=0.9.5
pkgrel=6
pkgdesc="DS emulator, sorta"
arch=("x86_64" "i686" "pentium4" "arm" "armv6h" "armv7h" "aarch64")
url="http://melonds.kuribo64.net/"
license=("GPL3")
makedepends=("git" "cmake" "pkg-config" "extra-cmake-modules")
depends=("libepoxy" "libslirp" "qt6-base" "qt6-multimedia" "sdl2")
source=("git+https://github.com/melonDS-emu/melonDS.git#tag=${pkgver}"
        "dont-fix-libslirp-interface.patch")
sha256sums=("SKIP"
            "1c157d21f89a750140727b2906abbd340a7e21257dd7eaeebdc60cf71ed82770")

prepare() {
  cd melonDS
  git cherry-pick -n e63e29ca91ba5fc1630634fbb9f064b9cce6cc1f # Fix build with GCC 14
  patch -p1 -i ../dont-fix-libslirp-interface.patch
}

build() {
  mkdir -p build
  cd build
  
  cmake ../melonDS \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DUSE_QT6=ON
  cmake --build .
}

package() {
  cd build
  
  DESTDIR="${pkgdir}" cmake --install .
}
