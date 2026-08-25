# shellcheck shell=bash
# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Axel McLaren <scm(at)axml(dot)uk>

_pkgname=krep
pkgname="$_pkgname-git"
pkgdesc='Fast text search tool with advanced algorithms, SIMD acceleration, multi-threading, and regex support (development version)'
pkgver=3.0.1.r0.g6ee7cf1
pkgrel=1
epoch=1
url='https://github.com/davidesantangelo/krep'
arch=('aarch64' 'x86_64')
license=('BSD-2-Clause')
makedepends=('git')
depends=('glibc')
provides=('krep')
conflicts=('krep')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --tags --long --abbrev=7 \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  git clean -dfx

  sed -i 's/CC =/CC ?=/g' Makefile
  sed -i 's/CFLAGS =/CFLAGS +=/g' Makefile
  sed -i 's/LDFLAGS =/LDFLAGS +=/g' Makefile
}

build() {
  cd "$_pkgname"

  make
}

package() {
  cd "$_pkgname"

  make PREFIX=/usr DESTDIR="$pkgdir" install

  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  for _dir in doc licenses; do
    cd "$pkgdir/usr/share/$_dir" && ln -srf "$pkgname" "$_pkgname"
  done
}

# eof
