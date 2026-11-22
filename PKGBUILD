# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgbase=percolator-git
pkgname=percolator-git
pkgver=4.00.r7.g6f91cf6
pkgrel=1
pkgdesc="Percolator and qvality, two post processors for shotgun proteomics data"
url="https://github.com/percolator/percolator"
license=(Apache-2.0)
arch=(x86_64)
depends=(gcc-libs libgomp)
makedepends=(git cmake)
provides=(percolator)
conflicts=(percolator percolator-converters
           percolator-converters-git)
source=("$pkgname::git+https://github.com/percolator/percolator#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --abbrev=7 --tags --match='rel*' HEAD |
    sed 's/^rel-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # The XML-based format converters (sqt2pin, msgf2pin, tandem2pin) were
  # removed upstream on master (commit eb157f74, released in 3.09); their
  # last version is packaged separately as percolator-converters(-git).
  # This package therefore builds only percolator and qvality.
  rm -rf "$srcdir/build"
}

build() {
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"

  cmake -B build -S "$srcdir/$pkgname" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DNO_TESTS=ON \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

