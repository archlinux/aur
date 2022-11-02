# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
# Contributor: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=bc-gh
pkgver=6.1.1
pkgrel=2
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
  '0e7fb4d4223ace8ba5c1961cc0d7eba475174f92b75529fde64446b5d80db5729f848fd95507570711d2b8928996c87e837e926d31028f32e3f97cad47567d39'
  '587107a6a2a4dd9fa19755dffbbe2a7712c18c6510330dcaca38a16ae6def168b7adb94479b9f58660cda0e5fc02ed41aa33cb4dad26baa67072ebd029b81c03'
)
sha256sums=(
  'b6de9e2fa4fcb1902c1686760dd90217543128f0298d418951ab1e9a03964097'
  '0ee87232806d666b68c968dd7d08e5069640ff2f61cfef9afbbd8b54c4b38b0a'
)
validpgpkeys=('FF360647C7A7147F27DAAEC1B132F881C306590A')
CFLAGS="$CFLAGS -flto=auto -O3"

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
