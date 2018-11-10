# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: carstene1ns <arch carsten-teibes de>

pkgname=lib32-sdl2_ttf
pkgver=2.0.14
pkgrel=3
pkgdesc='Library that allows you to use TrueType fonts in your SDL applications (Version 2) (32-bit)'
url='https://www.libsdl.org/projects/SDL_ttf'
arch=('x86_64')
license=('MIT')
depends=('lib32-sdl2' 'lib32-freetype2')
source=(https://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-${pkgver}.tar.gz
        freetype-pkgconfig.patch)
sha512sums=('4db817573fd216e26180f4c401cc869ce407589a461032fd7167dc612d35e038cca1ab67be7909b6b49c741581a68125ab46362ad8e3c0a2cdd39624ad847099'
            'abb3fd400c5d44789b891bad53124ca135ea3125affb95621623ab22fc43f5fbfeb79c63a97648936faf4698180837f76ca57143ee401610106d08741610e937')

prepare() {
  cd SDL2_ttf-${pkgver}

  # Fix build with FreeType 2.9.1
  patch -Np1 -i ../freetype-pkgconfig.patch

  touch NEWS README AUTHORS ChangeLog
  autoreconf -vi
}

build() {
  cd SDL2_ttf-${pkgver}
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  ./configure --disable-static --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd SDL2_ttf-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/include"
  install -Dm 644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
