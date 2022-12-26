# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
# Contributor: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=bc-gh
pkgver=6.2.1
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
  '6c0fcd1e5860d2e344c7245cd2ae2672b19ec184cb2723b2d811559edd47bb0b0874b0b5372a9c0f44cce6a7e9069a1b6eb99019a8d19a5b0d056b23ac44f0e3'
  'dae94037a7642cf6f0e88fa22db948d0cfb1d93852edcfa6ee46d192a765c015a8c1e126501e0d935d1af870035c7692bf98b471edae6feb11734ca91e71779b'
)
sha256sums=(
  '695c58fb3cf85fd7d5e2e2d5c64ac21f2f3b40bcb272a7e94f97195a85b5259f'
  'c15370bf54b3d6088d5dd31301190b924f196c796ec3c8bc1821b41bda6367c7'
)
validpgpkeys=('FF360647C7A7147F27DAAEC1B132F881C306590A')

build() {
  cd "bc-$pkgver"

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
