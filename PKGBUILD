# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
# Contributor: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=bc-gh
pkgver=6.7.2
pkgrel=1
pkgdesc="Implementation of dc and POSIX bc with GNU extensions"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/gavinhoward/bc"
license=('BSD')
provides=('bc')
conflicts=('bc')
depends=('glibc' 'libedit')
options=('lto')
source=(
  "$pkgname-$pkgver.tar.xz::$url/releases/download/$pkgver/bc-$pkgver.tar.xz"
  "$pkgname-$pkgver.tar.xz.sig::$url/releases/download/$pkgver/bc-$pkgver.tar.xz.sig"
)
sha512sums=(
  '8614277acd6b0b923a37fd84a22d868b33a44fcfdcc05e5e7a1637b7fd3c03e80bb9f578db9799c1c6d74a30c5c26bf53bd8f2328d7cb7f16f9e105ca98ff8a3'
  'dd8330aea5b6637f76d0fb632de4299bd333fed1e3b2dd6770ae96c383b2e4065a9ca6af24df9439ee27627e1e381c540f5245fb3e569d97ab4f5dd7491c0c26'
)
sha256sums=(
  '0888d4739caa855c40eab655ae562e900fe7f45a7308ee2feeb95416ec13c7f1'
  'babd19357ee69f4bc3ced9a65eba6c71e7e937ecd831dda89e4a4e7f029ca1c2'
)
validpgpkeys=('FF360647C7A7147F27DAAEC1B132F881C306590A')

build() {
  cd "bc-$pkgver"

  test -n "$LTOFLAGS" || LTOFLAGS='-flto=auto'

  env CFLAGS="$CFLAGS -O3" \
    PREFIX=/usr ./configure.sh -p GNU -e -G -sbc.banner -sdc.tty_mode
  make
}

check() {
  cd "bc-$pkgver"

  env LANG=C LC_ALL=C make check
}

package() {
  cd "bc-$pkgver"

  DESTDIR="$pkgdir" make install

  install -Dm0644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

  for _doc in {NEWS,NOTICE,README}.md; do
    install -Dm0644 "$_doc" "$pkgdir/usr/share/doc/$pkgname/$_doc"
  done
}

# eof
