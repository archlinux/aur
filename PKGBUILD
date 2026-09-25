# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=colm-git
pkgver=0.15.0.r75.g0164c85d
pkgrel=2
pkgdesc="A programming language designed for the analysis and transformation of computer languages"
arch=('i686' 'x86_64')
url="https://www.colm.net/open-source/colm/"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
makedepends=('git' 'asciidoc' 'fig2dev')
provides=("colm=$pkgver")
conflicts=('colm')
options=('staticlibs')
source=("git+https://github.com/adrian-thurston/colm-suite.git")
sha256sums=('SKIP')


pkgver() {
  cd "colm-suite"

  _tag=$(git tag -l --sort -v:refname | grep -E '^colm-[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^colm-//'
}

build() {
  cd "colm-suite"

  ./autogen.sh
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  CXXFLAGS="$CXXFLAGS -ffat-lto-objects" \
  ./configure \
    --prefix="/usr" \
    --disable-install-ragel
  make
}

check() {
  cd "colm-suite"

  #make check
}

package() {
  cd "colm-suite"

  make DESTDIR="$pkgdir" install
  install -Dm644 "colm.vim" -t "$pkgdir/usr/share/vim/vimfiles/syntax"
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/colm"
}
