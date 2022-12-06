# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Loui Chang <louipc [dot.] ist [at@] gmail.com>
# Contributor: aksr <aksr at t-com dot me>
​
pkgname=jove
pkgver=4.17.4.7
pkgrel=4
pkgdesc="Jonathan's Own Version of Emacs is an Emacs-like editor without Lisp."
url="https://github.com/jonmacs/jove"
license=('custom')
arch=('i686' 'x86_64')
depends=('ncurses')
makedpends=('pkgconf')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
sha256sums=('ca852dee892fb3f135ecfcd5fd94810b38581431aa474721c147941af7684ca5')
​
prepare() {
  cd "$pkgname-$pkgver"
  # This lets the Makefile use the ArchLinux supplied CFLAGS and LDFLAGS
  sed -i -e 's/^CFLAGS/#CFLAGS/g' -e 's/^LDFLAGS/#LDFLAGS/g' Makefile
}
​
build() {
  cd $pkgname-$pkgver
  CPPFLAGS="-DLinux $(pkgconf --cflags ncurses)"
  ldlibs="$(pkgconf --libs ncurses)"
  make SYSDEFS="$CPPFLAGS" TERMCAPLIB="$ldlibs" \
  LDLIBS="$ldlibs -lutil" JOVEHOME=/usr SHARDIR=/usr/share/jove \
  TMPDIR=/var/tmp RECDIR=/var/tmp/jove.preserve DFLTSHELL=/bin/sh
}
​
package() {
  cd $pkgname-$pkgver
  install -d "$pkgdir"/usr/{bin,lib/jove,share/jove}
  make JOVEHOME=/usr DESTDIR="$pkgdir" install
  cp -r "$pkgdir"/usr/man "$pkgdir"/usr/share
  rm -rf "$pkgdir"/usr/man
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/jove/LICENSE
}
