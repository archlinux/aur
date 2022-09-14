# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
# Contributor: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=bc-gh
pkgver=6.0.3
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
  'c5d1d64fa8061c168ca124d974b9965d516b833cbc5f023d4414ba1ba0616ab5e9336f36e747ad437534c964726883ac44a61a058b9e3184d95d078622922be0'
  '62c13ff0d4da370ab82956bee7af5b8e4bc296a7178734670e654bc3737b5a1c99e2da418c2e4e787a82f061f556b9b115439f892578b4547de69da3caf940ff'
)
sha256sums=(
  'a938cf4ef165ee63ca9ed378d442d62c121c5667f36c9193d12e79523094ae7a'
  '98cee879841b2444ce19d1b34c2a897d9405cd068f0dbbfe5b3b6ffe78599d17'
)
validpgpkeys=('E2A30324A4465A4D5882692EC08038BDF280D33E')
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
