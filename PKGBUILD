# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
# Contributor: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=bc-gh
pkgver=6.7.1
pkgrel=1
pkgdesc="Implementation of dc and POSIX bc with GNU extensions"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
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
  'feeb94b015cb9e77dd7e08fc28f27d520fec87e47bd72bb5b6d013340819783c5511f4fdce11a59b0807e316287e60bbd92436e119e94887e644f64c326d8900'
  '679ae47e6105075a5cd9b80d8587ad364662c2d4a0bc36d4e2594e21dd9b866cd816df8bf73507c4b8890306171e3919deb272ce3e69755aadadcbc4b0e083d8'
)
sha256sums=(
  '7fb9bbd7f84db96d1f7202b408fd944678531776eecd10ce25cfa7458de30d56'
  '44c29d36f9c755e2c40f8c0c2ac3ae47c0e8078083251b78651456a1f2fcb230'
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
