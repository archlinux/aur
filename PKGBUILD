# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=speexdsp-git
pkgver=1.2.1.r8.g738e179
pkgrel=1
pkgdesc="DSP library derived from speex"
arch=('i686' 'x86_64')
url="https://www.speex.org/"
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('git')
provides=("speexdsp=$pkgver" 'libspeexdsp.so')
conflicts=('speexdsp')
options=('staticlibs')
source=("git+https://gitlab.xiph.org/xiph/speexdsp.git")
sha256sums=('SKIP')


pkgver() {
  cd "speexdsp"

  _tag=$(git tag -l --sort -v:refname | grep -E '^SpeexDSP-[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^SpeexDSP-//'
}

build() {
  cd "speexdsp"

  ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "speexdsp"

  make check
}

package() {
  cd "speexdsp"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/speexdsp"
}
