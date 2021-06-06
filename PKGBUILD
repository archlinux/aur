# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=flmusic
pkgver=1.2.1
pkgrel=3.1
pkgdesc="Very simple CD/audio player application for FLTK"
arch=('i686' 'x86_64')
# url="http://home.arcor.de/szukw000/english_index.html"
url="https://github.com/bbidulock/$pkgname"
license=('LGPL')
depends=('fltk' 'alsa-lib' 'sox')
makedepends=('gendesk')
# source=(http://home.arcor.de/szukw000/$pkgname-fltk13-source-$pkgver.tgz)
source=("$url/releases/download/$pkgver/$pkgname-fltk13-source-$pkgver.tgz")
md5sums=('1e2e1bd760a7f5ea583093537090c3ae')

prepare() {
  cd $pkgname-fltk13-source-$pkgver
  sed -i '/ioctl.h/a #include <limits.h>' reader.c
  sed -i 's/$(installdir)/$(DESTDIR)$(installdir)/' Makefile.in
  sed -i '/\$(FLAGS)/s/\$(FLAGS)/\$(FLAGS) \$(LDFLAGS)/' Makefile.in
  gendesk -n -f --pkgname=$pkgname --pkgdesc="Very simple CD/audio player" --categories="AudioVideo;Audio;Player"
}

build() {
  cd $pkgname-fltk13-source-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-fltk13-source-$pkgver
  install -dm755 "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir" install
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
