# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=lib32-libvpx
pkgver=1.14.1
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
_tag=12f3a2ac603e8f10742105519e0cd03c3b8f71dd
source=(git+https://chromium.googlesource.com/webm/libvpx#tag=${_tag})
b2sums=('2ee22fba5822c0f3667c0c74de799536724ce88694b31e0493ce10c6f9a11c6ac563e39f5dcaf9fb4378346276610008dcbfc47f9407411b7c35ba4c71fb5f66')

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
