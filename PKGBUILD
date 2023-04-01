# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Roberto Carvajal <roberto@archlinux.org>

pkgname=multitail
pkgver=7.0.0
pkgrel=1
pkgdesc="Lets you view one or multiple files like the original tail program"
arch=('x86_64')
license=('GPL')
url="https://www.vanheusden.com/multitail"
depends=('ncurses')
makedepends=('cmake')
backup=('etc/multitail.conf')
#source=("https://www.vanheusden.com/multitail/${pkgname}-${pkgver}.tgz")
source=(https://github.com/folkertvanheusden/multitail/archive/$pkgver/$pkgname-$pkgver.tar.gz
        https://github.com/halturin/multitail/commit/d7d10f3b.patch
        https://github.com/folkertvanheusden/multitail/commit/608bad75.patch)
sha256sums=('23f85f417a003544be38d0367c1eab09ef90c13d007b36482cf3f8a71f9c8fc5'
            'fe11e16a081bbd37bf707cd0d2f77d60d97bf6090f09f32dab19181a886efb58'
            '19d639f38b578e83ba6480f6e0376d2dd336525b56de0953c5645b29b1c12085')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 < ../d7d10f3b.patch # Fix build with -Werror=format-security
  patch -p1 < ../608bad75.patch # Fix license install
  sed -i 's|ncursesw/panel.h|panel.h|' mt.h    
  sed -i 's|ncursesw/ncurses.h|ncurses.h|' mt.h
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  mv "$pkgdir"/{usr/,}etc
  mv "$pkgdir"/etc/multitail.conf{.new,}
}
# vim: ts=2 sw=2 et ft=sh
