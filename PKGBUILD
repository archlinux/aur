# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Loui Chang <louipc [dot.] ist [at@] gmail.com>
# Contributor: aksr <aksr at t-com dot me>

pkgname=jove
pkgver=4.17.4.9
pkgrel=1
pkgdesc="Jonathan's Own Version of Emacs is an Emacs-like editor without Lisp."
url="https://github.com/jonmacs/jove"
license=('custom')
arch=('i686' 'x86_64')
depends=('ncurses')
makedpends=('pkgconf')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
sha256sums=('6d9aeb85c04fedac7e3df2a1716e014dc53d6938f665fc32a9facd40c117102d')

prepare() {
  cd "$pkgname-$pkgver"
  # This lets the Makefile use the ArchLinux supplied CFLAGS and LDFLAGS
  sed -i -e 's/^CFLAGS/#CFLAGS/g' -e 's/^LDFLAGS/#LDFLAGS/g' Makefile
}

build() {
  cd $pkgname-$pkgver
  CPPFLAGS="-DLinux $(pkgconf --cflags ncurses)"
  ldlibs="$(pkgconf --libs ncurses)"
  make SYSDEFS="$CPPFLAGS" TERMCAPLIB="$ldlibs" \
  LDLIBS="$ldlibs -lutil" JOVEHOME=/usr SHARDIR=/usr/share/jove \
  TMPDIR=/var/tmp RECDIR=/var/tmp/jove.preserve DFLTSHELL=/bin/sh
}

package() {
  cd $pkgname-$pkgver
  install -d "$pkgdir"/usr/{bin,lib/jove,share/jove}
  make JOVEHOME=/usr DESTDIR="$pkgdir" install
  cp -r "$pkgdir"/usr/man "$pkgdir"/usr/share
  rm -rf "$pkgdir"/usr/man
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/jove/LICENSE
}
