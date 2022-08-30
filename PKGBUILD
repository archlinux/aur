# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
# Contributor: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=bc-gh
pkgver=6.0.2
pkgrel=1
pkgdesc="Implementation of dc and POSIX bc with GNU extensions"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/gavinhoward/bc"
license=('BSD')
provides=('bc')
conflicts=('bc')
depends=('libedit')
source=(
  "$pkgname-$pkgver.tar.xz::$url/releases/download/$pkgver/bc-$pkgver.tar.xz"
  "$pkgname-$pkgver.tar.xz.sig::$url/releases/download/$pkgver/bc-$pkgver.tar.xz.sig"
)
sha512sums=(
  '401826b113fda155b00a0157fa18c2a7244ef81b1c9df706fed41a31d9500d49c7b7d059104523f744465316f432332b280618e0afbb6891e78d3542444cc7e3'
  '93e962d733e1cc637a3a6465d58fb54dcfde2e38176c2d6c5e3dac043d5e45f4c078dbe5e20ce0d043c9967ba7a896ec0a63c133a50373c873ba3b023a54ab9c'
)
sha256sums=(
  'a4e51fda30515005f729422d184df7f04d9b4517614212aa65204db33c344046'
  'e20dc2ec37c8aa8c6c41b9a0091c4fc92de0f5de34302db04010eec598886d24'
)
validpgpkeys=('E2A30324A4465A4D5882692EC08038BDF280D33E')
CFLAGS="$CFLAGS -flto -O3"

build() {
  cd "bc-$pkgver"

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
