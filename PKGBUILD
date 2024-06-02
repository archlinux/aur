# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libraw-git
pkgver=0.21.2.r51.gd3cbbd0e
pkgrel=1
pkgdesc="A library for reading RAW files from digital cameras"
arch=('i686' 'x86_64')
url="https://www.libraw.org/"
license=('CDDL-1.0' 'LGPL-2.1-or-later')
depends=('gcc-libs' 'libjpeg' 'jasper' 'lcms2' 'zlib')
makedepends=('git')
provides=("libraw=$pkgver")
conflicts=('libraw')
options=('staticlibs')
source=("git+https://github.com/LibRaw/LibRaw.git")
sha256sums=('SKIP')


pkgver() {
  cd "LibRaw"

  _tag=$(git tag -l --sort -v:refname | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/-/_/g'
}

build() {
  cd "LibRaw"

  autoreconf -fi
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  CXXFLAGS="$CXXFLAGS -ffat-lto-objects" \
  ./configure \
    --prefix="/usr" \
    --disable-examples
  make
}

package() {
  cd "LibRaw"

  make DESTDIR="$pkgdir" install
}
