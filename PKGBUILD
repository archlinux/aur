# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

pkgname=qiv
pkgver=2.3.2
pkgrel=4
pkgdesc="Quick Image Viewer (qiv) is a very small and fast GDK/Imlib image viewer"
arch=('x86_64')
url="https://spiegl.de/qiv/"
license=('GPL2')
depends=('file' 'gtk2' 'imlib2' 'libexif' 'lcms2' 'desktop-file-utils')
source=(https://spiegl.de/qiv/download/$pkgname-$pkgver.tgz)
sha256sums=('48e0a088a0d5cf5fac2314a60b3aed62c4913e792627f64f03986865ad7080d5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s|^PREFIX = .*|PREFIX = /usr|" Makefile
  sed -i "s|\./qiv|echo &|" Makefile  # nuke test
  sed -i "s|)/man/|)/share/man/|" Makefile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s|^PREFIX = .*|PREFIX = $pkgdir/usr|" Makefile
  #mkdir -p "$pkgdir/usr/share/man/man1/"
  make COMPRESS_PROG="gzip -9nf" install

  install -D -m 0644 README "$pkgdir/usr/share/doc/qiv/README"
  install -d "$pkgdir/usr/share/doc/qiv/contrib"
  cp contrib/* "$pkgdir/usr/share/doc/qiv/contrib"
  #install -D -m 0755 contrib/gps2url.py "$pkgdir/usr/share/doc/qiv/contrib/gps2url.py"
  #install -D -m 0755 contrib/qiv-command.example "$pkgdir/usr/share/doc/qiv/contrib/qiv-command.example"
}
