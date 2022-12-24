# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
# Contributor: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=bc-gh
pkgver=6.2.0
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
  'c5f9f153e3353a76de4543b15530895d5d228a520db9e9de1ecbd78cc048a9438a9b800ccbb9f90c3fdd623e04757c3147c294bdde2526dad709ba768ef8736e'
  '8a0bb524b557b46addcdb8bd9edefd9f9002ad63d23e449a3ba2e8ea967e98cb87ec21024da6619073bef1c26242d86c20173f2193710463130df5fd85ef10ea'
)
sha256sums=(
  '8d4ec51abe88fd60b381a018c28275716340d2ae44ea1f15b5f38c8f86f1874a'
  '3efeaa446a093ffc12a48b1eac11ee0d083aa78870b35758e702880e0cb0001e'
)
validpgpkeys=('FF360647C7A7147F27DAAEC1B132F881C306590A')
CFLAGS="$CFLAGS -O3"

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
