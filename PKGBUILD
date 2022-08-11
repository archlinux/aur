# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Dan Ziemba <zman0900@gmail.com>

pkgname=lib32-libvpx1.3
pkgver=1.3.0
pkgrel=3
pkgdesc='VP8 and VP9 codec'
arch=(x86_64)
url=https://www.webmproject.org/
license=(BSD)
depends=(lib32-glibc)
makedepends=(
  git
  nasm
)
provides=(libvpx.so)
source=(
  libvpx-${pkgver}.tar.gz::https://github.com/webmproject/libvpx/archive/v${pkgver}.tar.gz
  libvpx-1.3-gcc-5.2.patch
  libvpx-1.3-not-x32.patch
)
b2sums=('7563f8b760287af3b7feab0c0a4001cb5e1451eb56b1f9b163eb38fd62c0aeb27760c0c009237cdfd1c7f73f438fe642d080b4bf9d797a0cf14ba199d035c411'
        '3940c09dfb7bd851ac051bc5b4d14bac51b1572a3ef1a3c923e34f42b1c1f75d2c2cab3b7f2aca161c9356665331b1e80be7a5af84bb19f959f069c16f4878d7'
        'ec8fcb395a2ca161114cc55ccac2d1d5a021a92389e5ae337cd44520d5803b2af8d0e8dd39e148dfea42e77ba83ca1cbdfda81ddf29d39c2e549e2670558ae85')

prepare() {
  cd libvpx-${pkgver}
  patch -Np1 -i ../libvpx-1.3-gcc-5.2.patch
  patch -Np1 -i ../libvpx-1.3-not-x32.patch
}

build() {
  cd libvpx-${pkgver}
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export CFLAGS+=' -ffat-lto-objects'
  export CXXFLAGS+=' -ffat-lto-objects'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --target=x86-linux-gcc \
    --enable-runtime-cpu-detect \
    --enable-shared \
    --enable-pic \
    --disable-install-docs \
    --disable-install-srcs \
    --enable-vp8 \
    --enable-postproc \
    --enable-vp9
  make
}

package() {
  cd libvpx-${pkgver}
  make DIST_DIR="${pkgdir}"/usr install
  rm -rf "${pkgdir}"/usr/{bin,include,lib32/{libvpx.{a,so},pkgconfig},share}
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/lib32-libvpx1.3/
}

# vim: ts=2 sw=2 et:
