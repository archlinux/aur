# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=galapix
pkgver=0.2.1
pkgrel=3
pkgdesc="A zoomable image viewer for large collections of images"
arch=('i686' 'x86_64')
url="https://github.com/Galapix/galapix"
license=('GPL3')
depends=('curl' 'glew' 'imagemagick6' 'libexif' 'libjpeg' 'libpng' 'mesa' 'sdl' 'sqlite3')
makedepends=('scons' 'patch' 'gtkglextmm' 'libglademm' 'boost' 'gcc7')
optdepends=('xcftools: XCF format support'
            'gimp-ufraw: RAW format support')
source=($pkgname-$pkgver.tar.gz::https://github.com/Galapix/galapix/archive/v$pkgver.tar.gz
        imagemagick_plugin.patch png_string_fix.patch)
md5sums=('7a7df7812a0c45e12273ace0c7c4ed48'
         '9f2397caa6bea257ca0cd09a31f96dbf'
         '34f0386d3247edc62e3ff4e55892d286')

prepare() {
  cd $pkgname-$pkgver
  patch -Np0 -i "${srcdir}"/imagemagick_plugin.patch
  patch -Np0 -i "${srcdir}"/png_string_fix.patch
  sed -ie '1 i#include <functional>' src/galapix/tile_provider.hpp src/spnav/space_navigator.cpp
}

build() {
  cd $pkgname-$pkgver
  scons CXX=g++-7
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 build/$pkgname.sdl "${pkgdir}"/usr/bin/$pkgname
}
