# shellcheck shell=bash
# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Marvin Gülker <quintus at quintilianus point eu>
# Contributor: Pierre Chapuis <catwell at archlinux dot us>
# Contributor: Uffe Jakobsen <uffe at uffe dot org>

pkgname='mlmmj'
pkgdesc='Simple and slim mailing list manager (MLM) inspired by ezmlm'
pkgver=1.8.0
_pkgver=1_8_0
pkgrel=1
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
  '1a096c8256b63a51717d71459987c9d739963a82ecf382779184794e93e32618'
  'SKIP' 'SKIP'  # Skip to my Lou
)

build() {
  cd "$pkgname-$pkgver"

  # Tests require “atf-c”. Anyone?
  ./configure --prefix=/usr --disable-tests

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

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
