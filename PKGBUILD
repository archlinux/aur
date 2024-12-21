# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=lib32-libvpx
pkgver=1.15.0
pkgrel=1
pkgdesc='VP8 and VP9 codec'
arch=(x86_64)
url=https://www.webmproject.org/
license=(custom:BSD)
depends=(
  lib32-gcc-libs
  libvpx
)
makedepends=(
  git
  nasm
)
provides=(libvpx.so)
_tag=5a65405dde363f5c50b568cf85bd7d6d874ce145
source=(git+https://chromium.googlesource.com/webm/libvpx#tag=${_tag})
b2sums=('6b2db5d77c0f6f8f0353dc9ae021a55e32ff8412d0cea9f2c0c5b258497d77c93968535bf98abb8108bf639fed303d961016817902767875d959fd5f21c8a2d3')

pkgver() {
  cd libvpx

  git describe --tags | sed 's/^v//'
}

build() {
  cd libvpx

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --target=x86-linux-gcc \
    --disable-install-bins \
    --disable-install-docs \
    --disable-install-srcs \
    --disable-unit-tests \
    --enable-pic \
    --enable-postproc \
    --enable-runtime-cpu-detect \
    --enable-shared \
    --enable-vp8 \
    --enable-vp9 \
    --enable-vp9-highbitdepth \
    --enable-vp9-temporal-denoising
  make
}

package() {
  cd libvpx

  make DIST_DIR="${pkgdir}/usr" install
  rm -rf "${pkgdir}"/usr/include

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s libvpx "${pkgdir}"/usr/share/licenses/lib32-libvpx
}

# vim:set sw=2 sts=-1 et:
