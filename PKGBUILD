# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgdesc='Dynamic, bytecode-compiled programming language and a dialect of Python (development version)'
pkgname='kuroko-git'
pkgver=1.4.0.r152.g05d30e8
pkgrel=2
url='https://github.com/kuroko-lang/kuroko'
arch=('aarch64' 'x86_64')
conflicts=('kuroko')
depends=('glibc')
license=('MIT')  # SPDX-License-Identifier: MIT
makedepends=('git')
provides=('kuroko' 'libkuroko')
sha256sums=('SKIP')
source=("git+$url.git")

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

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    README.md SECURITY.md
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" \
    LICENSE
}

# eof
