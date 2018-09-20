# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libraw-git
pkgver=0.19.0_Beta6.r45.g06028d0
pkgrel=1
pkgdesc="A library for reading RAW files from digital cameras"
arch=('i686' 'x86_64')
url="https://www.libraw.org/"
license=('CDDL' 'LGPL')
depends=('glibc' 'jasper' 'lcms2')
makedepends=('git')
provides=('libraw')
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

  autoreconf --install
  ./configure --prefix="/usr" --disable-examples
  make
}

package() {
  cd "LibRaw"

  make DESTDIR="$pkgdir" install

  rm "$pkgdir/usr/share/doc/libraw/COPYRIGHT"
  rm "$pkgdir/usr/share/doc/libraw"/LICENSE.*
}
