# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
# Contributor: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=bc-gh
pkgver=6.6.1
pkgrel=1
pkgdesc="Implementation of dc and POSIX bc with GNU extensions"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
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
  '5459ac61dc3fe39be9687616a801ecaf60caabb76cccc76d9e2e5aa4dc3efbb1cc33e2ad059d037c71ad3cce0cd9571d68bc13d09696cb43e5c3dfcdee117f9c'
  'e857bcbddc795fb9eb109366bf1626c291448d7c3fcc1bf3d0d2c4991ac5ea3c3f974e1404e4c8d2afacb677a235016706f1f0ab63ce0bb9777b41d01ea2868b'
)
sha256sums=(
  'd63ae205638fe86af04dd5a82a1df1edc2f0bf80e9ef85b52aabe47c9f0c7813'
  'fd34bec154932fa76e11488ae0baa70ae28b3127f2a1f59c92eb6cf00327210a'
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
