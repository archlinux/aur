# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
# Contributor: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=bc-gh
pkgver=6.7.5
pkgrel=1
pkgdesc='Implementation of dc and POSIX bc with GNU extensions'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://github.com/gavinhoward/bc'
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
  '5f689fd20801ea7ede725ae5dc4e8744bdf2d72424bffef99c53193a950f4bd83b6eb4c5a07556576d0b3f5b6cd7f9fc7cbcb41d27891f488bb2e97a186f76a4'
  '6d1770f8cb441136302e35c1e0017d6db9cfeabae28df03eaaa5c23873ddd79fd0ad6d275e660b82ecd0644b67d80ddaebaf3202715d71ac35878fc4d2ac6651'
)
sha256sums=(
  'c3e02c948d51f3ca9cdb23e011050d2d3a48226c581e0749ed7cbac413ce5461'
  '4cdc28f77a296d61ba955d8cd183b6e2e0bc90bf0c2e8e6a20b0937a360333bc'
)
validpgpkeys=('FF360647C7A7147F27DAAEC1B132F881C306590A')

_ltoflags='-flto=auto'
: "${LTOFLAGS:=$_ltoflags}"

build() {
  cd "bc-$pkgver"

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

  # If we have a tty, tell the user what we are doing
  test -t 1 && _verbose='v' || _verbose=''

  install "-${_verbose}Dm0644" LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

  for _doc in {NEWS,NOTICE,README}.md; do
    install "-${_verbose}Dm0644" "$_doc" "$pkgdir/usr/share/doc/$pkgname/$_doc"
  done
}

# eof
