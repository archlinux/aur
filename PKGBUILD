# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=less-git
pkgver=608.r0.g22e4af5
pkgrel=1
pkgdesc="A free, open-source file pager"
arch=('i686' 'x86_64')
url="https://greenwoodsoftware.com/less/"
license=('custom' 'GPL3')
depends=('glibc' 'ncurses' 'pcre2')
makedepends=('git' 'perl')
provides=("less=$pkgver")
conflicts=('less')
source=("git+https://github.com/gwsw/less.git")
sha256sums=('SKIP')


pkgver() {
  cd "less"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "less"

  make -f Makefile.aut \
    distfiles \
    all
  ./configure \
    --prefix="/usr" \
    --sysconfdir="/etc" \
    --with-regex=pcre2
  make
}

check() {
  cd "less"

  make check
}

package() {
  cd "less"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/less"
}
