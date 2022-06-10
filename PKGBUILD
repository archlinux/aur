# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
# Contributor: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=bc-gh
pkgver=5.3.1
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
  'f46870fec57772200141cf9fb664df0b492ca780ca09bfe0b509311cf510ec668c4b537ab5a18352d6a0717001758b5f49c1adf21406270945bf269f1fda3556'
  '9dacd131c562d7f0ab556be1cf2a4fc29793335d00b9a58f61a1a911a6a6803ec10b2646b804c5f1239c3d7f5e081269a5f5c493c3098c7fe8ebcdb74dcbb388'
)
sha256sums=(
  '82a7d076d648e1a53ae30b6621bb98fa631c3788c91870e5863f6ff408fd8927'
  '8ad7319f8e91760afc9d2ef1fe0db092709156a47a33e438039fa058fad38066'
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
