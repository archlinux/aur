# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
# Contributor: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=bc-gh
pkgver=6.7.0
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
  'a4b8c0b0ba8a214e2fdd271f5090d2977c8ee3053dc52d28cbd031a4a935f0e5d9c7be8df8e1cf106ac68c18faf136917a241f5e89597e271bf127df3d6d3f9f'
  'b11ec2d7dd85d01604a4e27922f72c0845f33694b0c3beb9b326686d85df52f5ee13c66cf24d72665965976ce004d75e13f923771eb8441432eb2d50233ff4d7'
)
sha256sums=(
  'd6a06c35c3c4230b1086e3a0f864e8c7b05211629f2bcb6dd46571ee47ef24ae'
  '73f64118a4317e171d070e5f692611fd9af2f8ccf737a6c326bfaaea674b0917'
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
