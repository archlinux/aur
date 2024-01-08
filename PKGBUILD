# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=arpack-git
pkgver=3.9.1.r4.g0eaf38b
pkgrel=1
pkgdesc="Collection of Fortran77 subroutines designed to solve large scale eigenvalue problems"
arch=('i686' 'x86_64')
url="https://github.com/opencollab/arpack-ng"
license=('BSD')
depends=('gcc-libs' 'lapack' 'openmpi')
makedepends=('gcc-fortran' 'git')
provides=("arpack=$pkgver")
conflicts=('arpack')
options=('staticlibs')
source=("git+https://github.com/opencollab/arpack-ng.git")
sha256sums=('SKIP')


pkgver() {
  cd "arpack-ng"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "arpack-ng"

  ./bootstrap
  ./configure \
    --prefix="/usr" \
    --enable-icb \
    --enable-mpi \
    --enable-static
  make \
    F77="mpif77" \
    CFLAGS="$CFLAGS $(pkg-config --cflags ompi-f77)" \
    LIBS="$LIBS $(pkg-config --libs ompi-f77)"
}

check() {
  cd "arpack-ng"

  #make check
}

package() {
  cd "arpack-ng"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/arpack"
}
