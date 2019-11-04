# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: yubimusubi <possum+aur@possum.cc>

pkgname=3dstool
pkgver=1.2.6
pkgrel=1
pkgdesc='An all-in-one tool for extracting/creating 3ds roms'
arch=(x86_64)
url=https://github.com/dnasdw/3dstool
license=(MIT)
depends=(
  libcurl.so
  openssl
)
makedepends=(
  cmake
  git
)
source=(
  git+https://github.com/dnasdw/3dstool.git#tag=e31a569b130d30eccd3f41ef5691cb2aca77e4f6
  3dstool-paths.patch
)
sha256sums=(
  SKIP
  5ac00e5b56182ffde04c7b9ab2a5151e6cf575400705f0b061ff832116757582
)

pkgver() {
  cd 3dstool

  git describe --tags | sed 's/^v//'
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build

  cd 3dstool

  patch -Np1 -i ../3dstool-paths.patch
}

build() {
  cd build

  cmake ../3dstool \
    -DCMAKE_BUILD_TYPE=Release \
    -DUSE_DEP=OFF
  make
}

package() {
  make -C build install
  install -Dm 755 3dstool/bin/3dstool -t "${pkgdir}"/usr/bin/
  install -Dm 644 3dstool/bin/ignore_3dstool.txt -t "${pkgdir}"/usr/share/3dstool/
}

# vim: ts=2 sw=2 et:
