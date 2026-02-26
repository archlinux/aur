# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='kuroko-git'
pkgdesc='Dynamic, bytecode-compiled programming language and a dialect of Python (development version)'
pkgver=1.5.0rc2.r7.g8d48f0a
pkgrel=1
url='https://github.com/kuroko-lang/kuroko'
arch=('aarch64' 'x86_64')
license=('MIT')  # SPDX-License-Identifier: MIT
makedepends=('git')
depends=('glibc')
provides=('kuroko' 'libkuroko')
conflicts=("${provides[@]}")
source=("git+$url.git")
sha256sums=('SKIP')
options=('!makeflags')

_pkgname="${pkgname/-git/}"

pkgver() {
  cd "$_pkgname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
  git clean -dfx

  make -C "$_pkgname" prefix=/usr
}

check () {
  make -C "$_pkgname" prefix=/usr test
}

package () {
  cd "$_pkgname"

  make prefix=/usr DESTDIR="$pkgdir" install

  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    README.md SECURITY.md
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE

  for _dir in doc licenses; do
    cd "$pkgdir/usr/share/$_dir" && ln -srf "$pkgname" "$_pkgname"
  done
}

# eof
