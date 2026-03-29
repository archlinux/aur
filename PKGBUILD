# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=lib32-libvpx
pkgver=1.16.0
pkgrel=2
pkgdesc='VP8 and VP9 codec'
arch=(x86_64)
url=https://www.webmproject.org/
license=(custom:BSD)
depends=(
  libvpx
)
makedepends=(
  git
  nasm
)
provides=(libvpx.so)
_tag=04def0a07f8bfa95785e30e6db95036cda17f9b2
source=(git+https://chromium.googlesource.com/webm/libvpx#tag=${_tag})
b2sums=('aebe079b448e4c1e0bb084d380266dde054800d0fcff3286e6de09d35365aa99eeeb9068ba22a532184c90abb6e8fa6109719ea48463b5d28d9a57a35f83e0a4')

pkgver() {
  cd libvpx

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd libvpx

  # Backport fix for CVE-2026-1861
  git cherry-pick -n d5f35ac8d93cba7f7a3f7ddb8f9dc8bd28f785e1
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
