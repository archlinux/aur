# Maintainer: Jah Way <jahway603 at tutanota dot de>
# Contributor: Arno Renevier <arno@renevier.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

pkgname=qiv
pkgver=3.0.4
pkgrel=1
pkgdesc='Quick Image Viewer (qiv) is a very small and fast GDK/Imlib image viewer'
arch=('x86_64')
url="https://codeberg.org/ciberandy/qiv"
license=('GPL-2.0-only')
depends=('file' 'gtk3' 'gdk-pixbuf2' 'libexif' 'lcms2' 'desktop-file-utils')
source=("$url/archive/v$pkgver.zip")
sha512sums=('ce388af7e66004f056dac04db5c0115b03a24ec6a235bc7d7c6d1a57b1b9d169efbfe33a9ca47b82c6705b092ef44f48e54416f9575af9d4e4207b2a0640604e')

build() {
  cd "$srcdir/$pkgname"
  sed -i "s|^PREFIX = .*|PREFIX = /usr|" Makefile
  sed -i "s|\./qiv|echo &|" Makefile  # nuke test
  sed -i "s|)/man/|)/share/man/|" Makefile
  make
}

package() {
  cd "$srcdir/$pkgname"
  sed -i "s|^PREFIX = .*|PREFIX = $pkgdir/usr|" Makefile
  #make COMPRESS_PROG="gzip -9nf" install
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm0644 "README" "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm0644 "README.COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/usr/share/doc/qiv/contrib"
  cp contrib/* "$pkgdir/usr/share/doc/qiv/contrib"
}
