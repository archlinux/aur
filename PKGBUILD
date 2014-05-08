# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Florian Pritz <flo@xinu.at>
# Contributor: Adam Hani Schakaki (krzd) <krzd@krzd.net>
# Contributor: Det <nimetonmaili at gmail a-dot com>
# Contributor: catalyst <catalyst@xaker.ru>
# Contributor: Devin Cofer <ranguvar{AT]archlinux[DOT}us>
# Contributor: jackobw
# Contributor: Gianni Vialetto <g dot vialetto at gmail dot com>

pkgname=cairo-compmgr
pkgver=0.3.1
pkgrel=7
epoch=2
pkgdesc="A Cairo based composite manager"
arch=(i686 x86_64)
url="https://github.com/gandalfn/Cairo-Composite-Manager"
license=(LGPL)
makedepends=(gettext gtk-doc "intltool>=0.41" git)
depends=("gtk2>=2.16.0" "vala>=0.24" libsm libgl gconf)
install=cairo-compmgr.install
options=(!libtool)
source=(https://github.com/downloads/gandalfn/Cairo-Composite-Manager/$pkgname-$pkgver.tar.bz2)
md5sums=('4ef285e0735b1a61b5db2205a2d8f8b3')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  #patch for compatibility with vala 0.24
  sed -i 's!libvala-0.16!libvala-0.24!' configure.ac
  sed -i 's!libvala-0.16!libvala-0.24!' vapi/cairo-compmgr.deps

  #patch for libiberty path bug
  sed -i 's!<libiberty.h>!<libiberty/libiberty.h>!' src/ccm-debug.c
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./autogen.sh --prefix=/usr LIBS="-ldl -lgmodule-2.0 -lz"
  make

}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir/usr/share/gconf/schemas/"
  gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/cairo-compmgr.schemas" "$pkgdir/etc/gconf/schemas/*.schemas"
  rm -rf "$pkgdir/etc/gconf/schemas/"
}
