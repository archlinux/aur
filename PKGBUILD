# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=celt-git
pkgver=0.11.3.r19.ge18de77
pkgrel=1
pkgdesc="Very low delay audio codec designed for high-quality communications"
arch=('i686' 'x86_64')
url="https://web.archive.org/web/20200502050215/http://www.celt-codec.org/"
license=('BSD-2-Clause')
depends=('glibc' 'libogg')
makedepends=('git')
provides=("celt=$pkgver")
conflicts=('celt')
options=('staticlibs')
source=("git+https://gitlab.xiph.org/xiph/celt.git")
sha256sums=('SKIP')


pkgver() {
  cd "celt"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "celt"

  ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "celt"

  make check
}

package() {
  cd "celt"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/celt"
}
