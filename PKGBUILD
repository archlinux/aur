# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=blis-git
pkgver=0.9.0.r134.ga72e4569f
pkgrel=1
pkgdesc="BLAS-like Library Instantiation Software Framework"
arch=('i686' 'x86_64')
url="https://github.com/flame/blis"
license=('custom')
depends=('gcc-libs')
makedepends=('git' 'python')
provides=("blis=$pkgver" 'blas' 'cblas')
conflicts=('blis' 'blas' 'cblas')
options=('staticlibs')
source=("git+https://github.com/flame/blis.git")
sha256sums=('SKIP')


pkgver() {
  cd "blis"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "blis"

  ./configure \
    --prefix="/usr" \
    --enable-cblas \
    --enable-threading=openmp auto
  make
}

check() {
  cd "blis"

  #make check
}

package() {
  cd "blis"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/blis"
}
