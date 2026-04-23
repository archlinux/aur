# shellcheck shell=bash
# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Marvin Gülker <quintus at quintilianus point eu>
# Contributor: Pierre Chapuis <catwell at archlinux dot us>
# Contributor: Uffe Jakobsen <uffe at uffe dot org>

pkgname='mlmmj'
pkgdesc='Simple and slim mailing list manager (MLM) inspired by ezmlm'
pkgver=2.0.0
_pkgver=2_0_0
pkgrel=3
_url='http://mlmmj.org/'
url='https://codeberg.org/mlmmj/mlmmj'
install="$pkgname.install"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
license=('MIT')  # SPDX-License-Identifier: MIT
depends=('bash' 'glibc' 'smtp-server')
optdepends=(
  'perl: for running some of the contributed scripts'
  'python: for running some of the contributed scripts'
)
source=(
  "$url/releases/download/RELEASE_$_pkgver/$pkgname-$pkgver.tar.xz"
  'sysuser.conf' 'tmpfile.conf'
)
sha256sums=(
  '1ec9c84bfabeddf3c1b31da410abd670d073a97a2ede7049a2b26bb80433994c'
  '4bbc24fc73ecb2d8f509c47eacff290921bb70a24b2a87b19704336cb4c466f1'
  '1836f8ddb013f3762e79b2bbd9e81f850d976c984fa2e24bcc8f39072eeb0d37'
)

build() {
  cd "$pkgname-$pkgver"

  # Tests require “atf-c”. Anyone?
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --disable-tests

  sed -i 's/CC=/CC\?=/g' mk/defs.mk
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  # ./configure doesn't seem to honor --mandir
  install -dm0755    "$pkgdir/usr/share/man/man1"
  install -Dm0644 -t "$pkgdir/usr/share/man/man1" \
    "$pkgdir/usr/man/man1"/*.1
  rm -rf "$pkgdir/usr/man"

  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    ChangeLog FAQ README.* TODO TUNABLES.md UPGRADE

  cp -fa contrib "$pkgdir/usr/share/doc/$pkgname/"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    AUTHORS COPYING LICENSE

  cd "$srcdir"

  install -Dm0644 sysuser.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm0644 tmpfile.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}

# eof
