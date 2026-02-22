# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=oac-git
pkgver=0.0.0.r24.gbc9317c6
pkgrel=1
pkgdesc="Reference implementation of the Open Audio Codec (OAC)"
arch=('i686' 'x86_64')
url="https://github.com/AOMediaCodec/oac"
license=('BSD-3-Clause-Clear')
depends=('glibc')
makedepends=('git')
provides=("oac=$pkgver" 'liboac.so')
conflicts=('oac')
options=('staticlibs')
source=("git+https://github.com/AOMediaCodec/oac.git")
sha256sums=('SKIP')


pkgver() {
  cd "oac"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "oac"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --enable-deep-plc \
    --enable-dred \
    --enable-osce \
    --enable-qext
  make
}

check() {
  cd "oac"

  #make check
}

package() {
  cd "oac"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/oac"
}
