# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=speex-git
pkgver=1.2.1.r58.g09b569d
pkgrel=1
pkgdesc="An patent-free audio compression format designed for speech"
arch=('i686' 'x86_64')
url="https://www.speex.org/"
license=('BSD-3-Clause')
depends=('glibc' lib{ogg,speexdsp}.so)
makedepends=('git' 'libogg' 'speexdsp')
provides=("speex=$pkgver" 'libspeex.so')
conflicts=('speex')
options=('staticlibs')
source=("git+https://gitlab.xiph.org/xiph/speex.git")
sha256sums=('SKIP')


pkgver() {
  cd "speex"

  _tag=$(git tag -l --sort -v:refname | grep -E '^Speex-[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^Speex-//'
}

build() {
  cd "speex"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --enable-binaries
  make
}

package() {
  cd "speex"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/speex"
}
