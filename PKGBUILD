# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: yubimusubi <possum+aur@possum.cc>

pkgname=3dstool
pkgver=1.0.26
pkgrel=1
pkgdesc='An all-in-one tool for extracting/creating 3ds roms'
arch=('i686' 'x86_64')
url='https://github.com/dnasdw/3dstool'
license=('None')
depends=('curl' 'glibc' 'openssl-1.0')
makedepends=('cmake')
source=("3dstool-${pkgver}.tar.gz::https://github.com/dnasdw/3dstool/archive/v${pkgver}.tar.gz"
        '3dstool-paths.patch'
        '3dstool-openssl1.0.patch')
sha256sums=('3c2288bac0d7a3d96416290c4032e5fc38776cef3ebfe0cb10d3faf14aab66f2'
            '5ac00e5b56182ffde04c7b9ab2a5151e6cf575400705f0b061ff832116757582'
            'f6099fde2c1cee1bba111ee112991f475ce29a56b55a17255d80f813dc2f598c')

prepare() {
  cd 3dstool-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build

  patch -Np1 -i ../3dstool-paths.patch
  patch -Np1 -i ../3dstool-openssl1.0.patch
}

build() {
  cd 3dstool-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DUSE_DEP='OFF'
  make
}

package() {
  cd 3dstool-${pkgver}/build

  make install

  install -Dm 755 ../bin/3dstool -t "${pkgdir}"/usr/bin/
  install -Dm 644 ../bin/ignore_3dstool.txt -t "${pkgdir}"/usr/share/3dstool/
}

# vim: ts=2 sw=2 et:
