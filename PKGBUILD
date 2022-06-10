# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
# Contributor: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=bc-gh
pkgver=5.3.0
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
  'e87b59265026a42ec162a40b39324165632741031afc3c06a65b719ffb937ce9833e553e046dfe6c44216315fd055bbc83f9666776bf31b1fa5d9bea434751c7'
  'ccfbd40e0d10fed392b180af288ce39f774622287307a1f6f44d58d3f907ffbd121cd9950118b8e223111027b88e38af629011aca4ac1d830dd407652d3c4fe0'
)
sha256sums=(
  '1ed2695f842701addc051db79e636faa976d0703a946e855f625e41c1d2d76ba'
  '914ca004cc8403ef8ff8a5526d27fd033834fa1b4b41091b9ea0785688e11670'
)
validpgpkeys=('E2A30324A4465A4D5882692EC08038BDF280D33E')
CFLAGS="$CFLAGS -flto -O3"

build() {
  cd "bc-$pkgver"

  PREFIX=/usr ./configure.sh -e -G -sbc.banner -sdc.tty_mode
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
