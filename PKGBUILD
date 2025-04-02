# Maintainer: Arno Renevier <arno@renevier.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

pkgname=qiv
pkgver=3.0.0
pkgrel=1
pkgdesc="Quick Image Viewer (qiv) is a very small and fast GDK/Imlib image viewer"
arch=('x86_64')
url="https://spiegl.de/qiv/"
license=('GPL2')
depends=('file' 'gtk3' 'gdk-pixbuf2' 'libexif' 'lcms2' 'desktop-file-utils')
source=(https://codeberg.org/ciberandy/qiv/archive/v$pkgver.zip 0001-fixes-build-failure-with-gdk3.patch)
sha256sums=('58ae9e05ce09a619a66bc3027fd92d295e5bc0932a64cf6da3c02ac8618aacf2'
            'd4bf58dfcb77e8769195888108a611bf4821c4453c330a7a14ac2bf04aff6363')

prepare() {
  cd "$srcdir/$pkgname"
  patch -p 1 -i "$srcdir/0001-fixes-build-failure-with-gdk3.patch"
}

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
