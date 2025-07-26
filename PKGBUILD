# -*- mode: sh -*-

#  Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: emk2203 <erik dot koennecke at gmail dot com>

pkgname='bc-gh'
pkgver=7.1.0
pkgrel=2
pkgdesc='Implementation of dc and POSIX bc with GNU extensions'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://github.com/gavinhoward/bc'
changelog="$pkgname.changelog"
license=('BSD-2-Clause')  # SPDX-License-Identifier: BSD-2-Clause
provides=('bc' 'dc')
conflicts=('bc')
depends=('glibc' 'libedit')
options=('!makeflags')
source=(
  "$pkgname-$pkgver.tar.xz::$url/releases/download/$pkgver/bc-$pkgver.tar.xz"
  "$pkgname-$pkgver.tar.xz.sig::$url/releases/download/$pkgver/bc-$pkgver.tar.xz.sig"
)
sha512sums=(
  'f80e6cb0c331de58d0619ea0ec44d6cc55bd1229391c65c67e9fa413371db7991ba8ff086f5cacae309b9d8186ad0ec4a6ab82e75e52f3bbfb367b393e750c32'
  '6817806f58cea70934a7c034884cc29daac266c953b6bae73f575de44be2abfb65d0e848873f567d901f348c637b830065f2fd250b847a1ba5d8dcb3b02ec619'
)
sha256sums=(
  '1f13663ba0f2435b684321714a4d0b9fff32bb951fc78dc7424cd69bba5c0d3a'
  '2f4939e9a86222fff43e526933d40f5b35f2d0ee5e5547aa6be203bd1523559b'
)
validpgpkeys=('FF360647C7A7147F27DAAEC1B132F881C306590A')

build() {
  cd "bc-$pkgver"

  env CFLAGS="$CFLAGS -O3" PREFIX=/usr \
    ./configure.sh -p GNU -e -G -sbc.banner -sdc.tty_mode

  make
}

check() {
  cd "bc-$pkgver"

  env LANG=C LC_ALL=C make test
}

package() {
  cd "bc-$pkgver"

  DESTDIR="$pkgdir" make install

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    {MEMORY_BUGS,NEWS,NOTICE,README}.md
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE.md
}

# eof
