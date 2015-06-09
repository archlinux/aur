# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jan Alexander Steffens <jan.steffens@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Mladen Pejakovic <pejakm@gmail.com>

pkgbase=lib32-libxkbcommon
pkgname=('lib32-libxkbcommon' 'lib32-libxkbcommon-x11')
pkgver=0.5.0
pkgrel=1
arch=('x86_64')
url='http://xkbcommon.org/'
license=('custom')
makedepends=('gcc-multilib' 'lib32-libxcb' 'xorg-util-macros')
source=("http://xkbcommon.org/download/libxkbcommon-${pkgver}.tar.xz")
sha256sums=('90bd7824742b9a6f52a6cf80e2cadd6f5349cf600a358d08260772615b89d19c')

prepare() {
  mkdir -p x11/usr/lib32/pkgconfig
}

build() {
  cd libxkbcommon-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --disable-docs \
    --disable-static
  make
}

package_lib32-libxkbcommon() {
  pkgdesc='Keyboard handling library using XKB data'
  depends=('lib32-glibc' 'libxkbcommon')

  cd libxkbcommon-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/include

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s libxkbcommon "${pkgdir}"/usr/share/licenses/lib32-libxkbcommon

  mv "${pkgdir}"/usr/lib32/*x11* ../x11/usr/lib32
  mv "${pkgdir}"/usr/lib32/pkgconfig/*x11* ../x11/usr/lib32/pkgconfig
}

package_lib32-libxkbcommon-x11() {
  pkgdesc='Keyboard handling library using XKB data for X11 XCB clients'
  depends=('lib32-libxcb' 'lib32-libxkbcommon' 'libxkbcommon-x11')

  mv x11/* "${pkgdir}"/
  find "${pkgdir}" -type d -exec chmod 755 {} +

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s libxkbcommon-x11 "${pkgdir}"/usr/share/licenses/lib32-libxkbcommon-x11
}

# vim: ts=2 sw=2 et:
