# Maintainer:
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Mateusz Herych <heniekk@gmail.com>

pkgname=ekg2
pkgver=0.3.1+5815+gaef7c7e1
_pkgver=0.3.1
pkgrel=1
pkgdesc='Ncurses based Jabber, Gadu-Gadu, Tlen and IRC client'
arch=('x86_64')
url='http://en.ekg2.org/'
license=('GPL')
depends=('aspell' 'gpgme' 'gpm' 'libgadu' 'python2')
makedepends=('git')
_commit=aef7c7e1a1e8ff64e1503571ffd75029468548a5  # master
source=("git+https://github.com/ekg2/ekg2#commit=$_commit"
         openssl-1.1.patch)
md5sums=('SKIP'
         '8d0528fbfb182b5c75723f9d84f0e3bc')

pkgver() {
  cd $pkgname
  printf "$_pkgver+%s+g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname
  patch -Np1 -i ../openssl-1.1.patch
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' contrib/python/notify-bubble.py
}

build() {
  cd $pkgname
  ./autogen.sh --prefix=/usr PYTHON=python2
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/lib/perl5/5.*/core_perl
}
