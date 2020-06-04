# Maintainer:
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Mateusz Herych <heniekk@gmail.com>

pkgname=ekg2
pkgver=0.3.1+5820+gf427d083
_pkgver=0.3.1
pkgrel=1
pkgdesc='Ncurses based Jabber, Gadu-Gadu, Tlen and IRC client'
arch=('x86_64')
url='https://github.com/ekg2/ekg2'
license=('GPL')
depends=('aspell' 'gpgme' 'gpm' 'libgadu' 'python2')
makedepends=('git')
_commit=f427d083ee899d42532c046100490a915b0e8a82  # master
source=("git+https://github.com/ekg2/ekg2#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "$_pkgver+%s+g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname
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
