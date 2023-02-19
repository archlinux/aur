# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
# Contributor: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=bc-gh
pkgver=6.2.6
pkgrel=1
pkgdesc="Implementation of dc and POSIX bc with GNU extensions"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/gavinhoward/bc"
license=('BSD')
provides=('bc')
conflicts=('bc')
depends=('libedit')
options=('lto')
source=(
  "$pkgname-$pkgver.tar.xz::$url/releases/download/$pkgver/bc-$pkgver.tar.xz"
  "$pkgname-$pkgver.tar.xz.sig::$url/releases/download/$pkgver/bc-$pkgver.tar.xz.sig"
)
sha512sums=(
  'f3631ff2378e93f9758a133400749973681f142f3eeaf1ae8ffc60f1a31b9ca9a9bcdf14435b72fea8b8ea486d0fb6b53954a511c5db62d834bf6cf270d7e4a5'
  '00be13a37de81802c8fb4fa576dc214a5a2321c34d22d9c281a8f693bab132eb9b1bb1c1462c1f924a989e47911d8c769910af76249cb755028913f755ce3e52'
)
sha256sums=(
  'ee93c0990ca3a31e734d7fef79f1dd771fa2e3e5219971cfc38c9c9095517005'
  '47306978cdcc165e592eb136162d978254f0314abdf1d401f689f3c0bfb591c0'
)
validpgpkeys=('FF360647C7A7147F27DAAEC1B132F881C306590A')

build() {
  cd "bc-$pkgver"

  test -n "$LTOFLAGS" || LTOFLAGS='-flto=auto'

  CFLAGS="$CFLAGS -O3"
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
