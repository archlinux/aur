# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=lib32-libvpx
pkgver=1.12.0
pkgrel=2
pkgdesc='VP8 and VP9 codec'
arch=(x86_64)
url=https://www.webmproject.org/
license=(BSD)
depends=(
  lib32-gcc-libs
  libvpx
)
makedepends=(
  git
  nasm
)
provides=(libvpx.so)
_tag=03265cd42b3783532de72f2ded5436652e6f5ce3
source=(git+https://chromium.googlesource.com/webm/libvpx#tag=${_tag})
sha256sums=(SKIP)

pkgver() {
  cd libvpx

  git describe --tags | sed 's/^v//'
}

build() {
  cd libvpx

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  CFLAGS+=' -ffat-lto-objects'
  CXXFLAGS+=' -ffat-lto-objects'

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
