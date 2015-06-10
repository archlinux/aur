# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Aaditya Bagga <aaditya_gnulinux@zoho.com>

pkgname=gpaint
pkgver=0.3.3
pkgrel=12
pkgdesc="A small easy-to-use paint program for the GNOME Desktop"
arch=('x86_64' 'i686')
license=('GPL')
depends=('libglade' 'gdk-pixbuf2')
url="http://savannah.gnu.org/projects/gpaint/"
source=("ftp://alpha.gnu.org/gnu/$pkgname/$pkgname-2-$pkgver.tar.gz"
        'fill.patch::https://savannah.gnu.org/patch/download.php?file_id=19341' 
        "$pkgname.desktop")
sha256sums=('541706460610c8bd917225a0370762b66e378e756afa780e67677eeb0a2dd0eb'
            'd8600339f2a53e21c46e150e29817f1f999d8963859712d2f988b38687ebb2a5'
            'c4ccd43e1343befa8cfcca0e644fd2268315b328277346ebf236260e467d62cd')

prepare() {
  cd "$pkgname-2-$pkgver"
  sed -i 's#GTK_RESPONSE_DISCARD#GTK_RESPONSE_NO#' src/drawing.c
  patch -p1 -i $srcdir/fill.patch
}

build() {
  cd "$pkgname-2-$pkgver"
  ./configure --prefix=/usr
  make LDFLAGS+="-lm"
}

package() {
  cd "$pkgname-2-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm755 "$pkgdir/usr/bin/$pkgname-2" "$pkgdir/usr/bin/$pkgname"
  rm "$pkgdir/usr/bin/$pkgname-2" 
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
