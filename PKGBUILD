# Maintainer: Sommio Lepir <sommio.mail@gmail.com>

pkgname=x265-mod-patman-git
pkgver=3.6+2+13.r0.g9a3dac6e5
pkgrel=1
pkgdesc='Open Source H265/HEVC video encoder (patman fork git version)'
arch=(x86_64)
url=https://github.com/Patman86/x265-Mod-by-Patman
license=(GPL)
depends=(gcc-libs)
makedepends=(
  cmake
  git
  nasm
  ninja
)
provides=('x265' 'libx265.so')
conflicts=('x265')
source=(git+https://github.com/Patman86/x265-Mod-by-Patman.git)
sha256sums=(SKIP)

pkgver() {
  git -C x265-Mod-by-Patman describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cmake -S x265-Mod-by-Patman/source -B build-12 -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DHIGH_BIT_DEPTH=TRUE \
    -DMAIN12=TRUE \
    -DEXPORT_C_API=FALSE \
    -DENABLE_CLI=FALSE \
    -DENABLE_SHARED=FALSE \
    -Wno-dev
  ninja -C build-12

  cmake -S x265-Mod-by-Patman/source -B build-10 -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DHIGH_BIT_DEPTH=TRUE \
    -DEXPORT_C_API=FALSE \
    -DENABLE_CLI=FALSE \
    -DENABLE_SHARED=FALSE \
    -Wno-dev
  ninja -C build-10

  cmake -S x265-Mod-by-Patman/source -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_SHARED=TRUE \
    -DENABLE_HDR10_PLUS=TRUE \
    -DEXTRA_LIB='x265_main10.a;x265_main12.a' \
    -DEXTRA_LINK_FLAGS='-L .' \
    -DLINKED_10BIT=TRUE \
    -DLINKED_12BIT=TRUE \
    -Wno-dev
  ln -s ../build-10/libx265.a build/libx265_main10.a
  ln -s ../build-12/libx265.a build/libx265_main12.a
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

