# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
# Contributor: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=bc-gh
pkgver=6.5.0
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
  '1cb03038d828a0b10734c29931777add8b22f194c507b8ff538ec1aa52a2a97a4ac2733d72cdb0710fdc6937807074e929f7918c56aaf5be8fbe908ea7c5a401'
  'af40494264af605339ddb6738c1f13ab7dd1cc2eba7b3a4ef98ed47094159950f4266876dd8fad179250ecad3c74cafa9791d5302d736eb5e0c5d3c77b000c4d'
)
sha256sums=(
  'b1afb1f50c0bce6119c98590bcc8afc22f520bc85c2b512c83938dbb8321cc30'
  'c8675323d281c3a1b7ad54005d8bb254ae1bbfb6040d7a625e5edaba0cbca9fe'
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
