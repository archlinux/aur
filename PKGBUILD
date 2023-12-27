# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=opencore-amr-git
pkgver=0.1.6.r0.g7dba8c3
pkgrel=1
pkgdesc="Open source implementation of the Adaptive Multi Rate (AMR) speech codec"
arch=('i686' 'x86_64')
url="https://opencore-amr.sourceforge.io/"
license=('Apache')
depends=('glibc')
makedepends=('git')
provides=("opencore-amr=$pkgver" 'libopencore-amrnb.so' 'libopencore-amrwb.so')
conflicts=('opencore-amr')
options=('staticlibs')
source=("git+https://git.code.sf.net/p/opencore-amr/code")
sha256sums=('SKIP')


pkgver() {
  cd "code"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "code"

  autoreconf -fi
  ./configure \
    --prefix="/usr" \
    --enable-examples
  make
}

check() {
  cd "code"

  make check
}

package() {
  cd "code"

  make DESTDIR="$pkgdir" install
}
