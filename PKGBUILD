# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
# Contributor: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=bc-gh
pkgver=5.3.3
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
  '94f7c35761211b4909f4bc5a2c19e7cd6589f7b6c2fa6eaf0a889d682ffd3f3ba79b3580d9e2aa4bef32b4c7874d047d0fba4e7dace05d63c87f884afbe8020f'
  '1fa5b61dd76e55cf5122fb019051f5cb8ac1433776f52a13cd1c017d8d66b418fc52dd95ad1de3f06cb0995cfb9b905841a83e1fffc90210d097f92eb4777923'
)
sha256sums=(
  '616350bd0ea3ee1ebfc8580f0bf8bcec94c7f7cdeed397394e318e5f2a2cdb23'
  '130272040e22d0c28d9d88f08c6a04591d11a17ad3ce07b5c882077d031d1a0b'
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
