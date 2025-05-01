# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='kanzi-git'
_pkgname="${pkgname/-git}"
pkgver=2.3.0.r216.gb6ec9e05
pkgrel=3
pkgdesc='Modern, modular, portable and efficient lossless data compressor and decompressor (development version)'
arch=('aarch64' 'x86_64')
url='https://github.com/flanglet/kanzi-cpp'
source=("$_pkgname::git+$url.git")
license=('Apache-2.0')  # SPDX-License-Identifier: Apache-2.0
provides=("$_pkgname")
conflicts=("${provides[@]}")
depends=('gcc-libs' 'glibc')
makedepends=('git')

prepare() {
  cd "$srcdir/$_pkgname/src"

  git clean -dfx
  sed -i 's/CXXFLAGS=/CXXFLAGS+=/;s/LDFLAGS=/LDFLAGS+=/g' Makefile
}

pkgver() {
  cd "$srcdir/$_pkgname"

  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname/src"

  make clean
  make kanzi
}

package() {
  cd "$srcdir/$_pkgname"

  install -vDm0755 -t "$pkgdir/usr/bin" \
    bin/kanzi

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    {README,SECURITY}.md

  install -vDm0644 -t "$pkgdir/usr/share/man/man1" \
    kanzi.1.gz
}

sha256sums=('SKIP')

# eof
