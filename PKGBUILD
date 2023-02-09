# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Jameson Pugh <imntreal@gmail.com>

pkgname=lib32-sdl2_image
pkgver=2.6.3
pkgrel=1
pkgdesc='A simple library to load images of various formats as SDL surfaces'
arch=(x86_64)
url=https://www.libsdl.org/projects/SDL_image/
license=(MIT)
depends=(
  lib32-glibc
  lib32-libjpeg
  lib32-libpng
  lib32-libtiff
  lib32-sdl2
  lib32-libwebp
  sdl2_image
)
makedepends=(git)
_tag=d3c6d5963dbe438bcae0e2b6f3d7cfea23d02829
source=(git+https://github.com/libsdl-org/SDL_image.git#tag=${_tag})
b2sums=(SKIP)

prepare() {
  cd SDL_image
  ./autogen.sh
}

pkgver() {
  cd SDL_image
  git describe --tags | sed 's/^release-//'
}

build() {
  cd SDL_image
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --disable-static \
    --disable-jxl
  make
}

package() {
  make DESTDIR="${pkgdir}" -C SDL_image install
  rm -rf "${pkgdir}"/usr/include
  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s sdl2_image "$pkgdir"/usr/share/licenses/lib32-sdl2_image
}

# vim: ts=2 sw=2 et:
