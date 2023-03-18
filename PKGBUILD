# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=flex-git
pkgver=2.6.4.r439.g3aedd28
pkgrel=1
pkgdesc="The Fast Lexical Analyzer - scanner generator for lexing in C and C++"
arch=('i686' 'x86_64')
url="https://github.com/westes/flex"
license=('custom')
depends=('glibc' 'm4' 'sh')
makedepends=('git' 'help2man' 'texinfo')
provides=("flex=$pkgver")
conflicts=('flex')
options=('staticlibs')
source=("git+https://github.com/westes/flex.git")
sha256sums=('SKIP')


pkgver() {
  cd "flex"

  _tag=$(git tag -l --sort -v:refname | grep -P '^v?[\d\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "flex"

  ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "flex"

  make check
}

package() {
  cd "flex"

  make DESTDIR="$pkgdir" install
  ln -s flex "$pkgdir/usr/bin/lex"
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/flex"
}
