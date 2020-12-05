# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: oi_wtf <brainpower@mailbox.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Vladimir Kirillov <proger@wilab.org.ua>

pkgname=lib32-libpgm
pkgver=5.3.128
pkgrel=2
pkgdesc='An implementation of the PGM reliable multicast protocol'
arch=('x86_64')
url='https://github.com/steve-o/openpgm'
license=('LGPL2.1')
depends=('lib32-glibc' 'libpgm')
makedepends=('cmake' 'gcc-multilib' 'python')
options=('!strip')
source=("libpgm-${pkgver}.tar.gz::https://github.com/steve-o/openpgm/archive/release-${pkgver//./-}.tar.gz"
         lib32-libpgm-undefined-symbol.patch::"https://github.com/steve-o/openpgm/commit/b7fa865f.patch")
sha256sums=('8d707ef8dda45f4a7bc91016d7f2fed6a418637185d76c7ab30b306499c6d393'
            '167ccb9ee3432d96e7ce433f67dd852877a594a096d8562ba45362370c3de86c')

prepare() {
  cd openpgm-release-${pkgver//./-}/openpgm/pgm
  cp openpgm-5.2.pc.in openpgm-5.3.pc.in
  patch -p3 -i "$srcdir"/lib32-libpgm-undefined-symbol.patch # Fix undefuned symbol

  autoreconf -fiv
}

build() {
  cd openpgm-release-${pkgver//./-}/openpgm/pgm \

  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32'
  make
}

package() {
  cd openpgm-release-${pkgver//./-}/openpgm/pgm \

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/{bin,lib,include,share}}
}

# vim: ts=2 sw=2 et:
