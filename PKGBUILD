# Maintainer: Arno Renevier <arno@renevier.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

pkgname=qiv
pkgver=3.0.2
pkgrel=1
pkgdesc="Quick Image Viewer (qiv) is a very small and fast GDK/Imlib image viewer"
arch=('x86_64')
url="https://spiegl.de/qiv/"
license=('GPL2')
depends=('file' 'gtk3' 'gdk-pixbuf2' 'libexif' 'lcms2' 'desktop-file-utils')
source=(https://codeberg.org/ciberandy/qiv/archive/v$pkgver.zip)
sha256sums=('9d7c2e77b2b86d5778755d6cf0bb39edd76a168267579973a07aef208d53f564')

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
  #mkdir -p "$pkgdir/usr/share/man/man1/"
  make COMPRESS_PROG="gzip -9nf" install

  install -D -m 0644 README "$pkgdir/usr/share/doc/qiv/README"
  install -d "$pkgdir/usr/share/doc/qiv/contrib"
  cp contrib/* "$pkgdir/usr/share/doc/qiv/contrib"
  #install -D -m 0755 contrib/gps2url.py "$pkgdir/usr/share/doc/qiv/contrib/gps2url.py"
  #install -D -m 0755 contrib/qiv-command.example "$pkgdir/usr/share/doc/qiv/contrib/qiv-command.example"
}
