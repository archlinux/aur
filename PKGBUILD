# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Jameson Pugh <imntreal@gmail.com>

pkgname=lib32-sdl2_image
pkgver=2.0.1
pkgrel=1
pkgdesc="A simple library to load images of various formats as SDL surfaces (Version 2, 32 bit)"
arch=('x86_64')
url="https://www.libsdl.org/projects/SDL_image/"
license=('MIT')
depends=("${pkgname#*-}>=$pkgver" 'lib32-sdl2' 'lib32-libpng' 'lib32-libtiff'
         'lib32-libjpeg' 'lib32-libwebp')
makedepends=('cmake')
conflicts=('lib32-sdl2-image') # to replace broken package with wrong name
source=("${url}release/SDL2_image-$pkgver.tar.gz")
sha256sums=('3a3eafbceea5125c04be585373bfd8b3a18f259bd7eae3efc4e6d8e60e0d7f64')

build() {
  cd SDL2_image-$pkgver

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --disable-static --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  make -C SDL2_image-$pkgver DESTDIR="$pkgdir/" install

  # remove header
  rm -rf "$pkgdir"/usr/include

  # link license
  install -d "$pkgdir"/usr/share/licenses
  ln -s ${pkgname#*-} "$pkgdir"/usr/share/licenses/$pkgname
}
