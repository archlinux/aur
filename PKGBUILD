# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=less-git
pkgver=691.r11.g7f99df7
pkgrel=1
pkgdesc="A free, open-source file pager"
arch=('i686' 'x86_64')
url="https://greenwoodsoftware.com/less/"
license=('GPL-3.0-or-later' 'LicenseRef-less')
depends=('glibc' 'ncurses' 'pcre2')
makedepends=('git' 'perl')
provides=("less=$pkgver")
conflicts=('less')
source=("git+https://github.com/gwsw/less.git")
sha256sums=('SKIP')


pkgver() {
  cd "less"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
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

  #make check
}

package() {
  cd "less"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/less"
}
