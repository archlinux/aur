# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Roberto Carvajal <roberto@archlinux.org>

pkgname=multitail
pkgver=7.1.4
pkgrel=1
pkgdesc='View one or multiple files like the original tail program'
arch=('x86_64')
license=('MIT')
url="https://www.vanheusden.com/multitail"
depends=('glibc' 'bash' 'ncurses' 'perl')
makedepends=('cmake')
backup=('etc/multitail.conf')
source=(https://github.com/folkertvanheusden/multitail/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('96b781a9c22f3518fc25c4f3ce3833ec5069158b2a743a30f7586cd063824704')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's|ncursesw/panel.h|panel.h|' mt.h
  sed -i 's|ncursesw/ncurses.h|ncurses.h|' mt.h
  echo "VERSION=$pkgver" >version
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
  mv "$pkgdir"/usr/share/doc/multitail{-$pkgver,}

  cd $pkgname-$pkgver
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/multitail/
}

# vim: ts=2 sw=2 et ft=sh
