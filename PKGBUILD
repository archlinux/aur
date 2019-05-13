# Maintainer: Roberto Rossini ("robymetallo") <roberto.rossini.9533@student.uu.se>

pkgname=diamond-aligner-git
pkgver=v0.9.24.r46.gd333bab
pkgrel=1
pkgdesc="Accelerated BLAST compatible local sequence aligner."

url='https://github.com/bbuchfink/diamond'
arch=('x86_64')

license=('GPL3')

depends=('gcc-libs' 'zlib')
makedepends=('cmake')

provides=('diamond-aligner')
conflicts=('diamond-aligner')

source=("git+https://github.com/bbuchfink/diamond.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/diamond"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

}

prepare() {
   ln -s "$srcdir/diamond" "$srcdir/diamond-$pkgver"
   mkdir -p "$srcdir/diamond-$pkgver/build"

}

build() {
  cd "$srcdir/diamond-$pkgver/build"
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..
 
  make

}

check() {
  cd "$srcdir/diamond-$pkgver/build"
  ./diamond --version

}

package() {
  cd "$srcdir/diamond-$pkgver/build"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/diamond-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
 
