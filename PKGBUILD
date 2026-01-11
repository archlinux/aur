# shellcheck shell=bash
# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Marvin Gülker <quintus at quintilianus point eu>
# Contributor: Pierre Chapuis <catwell at archlinux dot us>
# Contributor: Uffe Jakobsen <uffe at uffe dot org>

pkgname='mlmmj'
pkgdesc='Simple and slim mailing list manager (MLM) inspired by ezmlm'
pkgver=1.7.0
_pkgver=1_7_0
pkgrel=1
depends=('bash' 'glibc' 'smtp-server')
optdepends=(
  'perl:	for running some of the contributed scripts'
  'python:	for running some of the contributed scripts'
)
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
_url='http://mlmmj.org/'
url='https://codeberg.org/mlmmj/mlmmj'
license=('MIT')  # SPDX-License-Identifier: MIT
source=(
  "$url/releases/download/RELEASE_$_pkgver/mlmmj-$pkgver.tar.xz"
  'sysuser.conf'
  'tmpfile.conf'
)
install="$pkgname.install"
sha256sums=(
  '13b5a90f1cdc0c1d0dfc4e99a1202ded4c26888534515710a4469489a5a1b9ac'
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

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    ChangeLog FAQ README.* TODO TUNABLES.md UPGRADE

  cp -vfa contrib "$pkgdir/usr/share/doc/$pkgname/"

  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" \
    AUTHORS COPYING LICENSE

  cd "$srcdir"

  install -vDm0644 sysuser.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm0644 tmpfile.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}

# eof
