# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=glpk-git
pkgver=5.0.r242.g4e03800
pkgrel=1
pkgdesc="GNU Linear Programming Kit: solve LP, MIP and other problems"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/glpk/"
license=('GPL')
depends=('glibc' 'gmp')
makedepends=('git')
provides=("glpk=$pkgver")
conflicts=('glpk')
options=('staticlibs')
source=("git+https://salsa.debian.org/science-team/glpk.git")
sha256sums=('SKIP')


pkgver() {
  cd "glpk"

  _tag=$(git tag -l --sort -v:refname | grep -E '^upstream/[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's|^upstream/||'
}

build() {
  cd "glpk"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --with-gmp
  make
}

check() {
  cd "glpk"

  make check
}

package() {
  cd "glpk"

  make DESTDIR="$pkgdir" install
  install -Dm644 doc/{glpk,gmpl}.pdf -t "$pkgdir/usr/share/doc/glpk"
}
