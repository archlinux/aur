# Maintainer: Dario Pellegrini <pellegrini.dario@gmail.com>

pkgname=cgal-git
_pkgname=cgal
pkgver=r98262.16c0aab3cc0
pkgrel=1
pkgdesc="Computational Geometry Algorithms Library"
arch=('x86_64')
url="https://github.com/CGAL/cgal.git"
license=('GPL' 'LGPL')
depends=('mpfr' 'gmp')
makedepends=('git' 'cmake')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/CGAL/cgal.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p "$srcdir/$_pkgname/build"
  cd "$srcdir/$_pkgname/build"
  cmake ../ -DCGAL_HEADER_ONLY=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
}

build() {
  # Just in case you turned OFF CGAL_HEADER_ONLY, otherwise nothing to do
  cd "$srcdir/$_pkgname/build"
  make -j$(nproc)
}

package () {
  mkdir -p "$srcdir/$_pkgname/build"
  cd "$srcdir/$_pkgname/build"
  make install DESTDIR="$pkgdir"

  # The tarball still has all these licenses included
  for _license in "LICENSE"{,.GPL,.LGPL,.BSL,.COMMERCIAL,.RFL}; do
    install -D -m644 "$srcdir/$_pkgname/Installation/$_license" "$pkgdir/usr/share/licenses/$pkgname/$_license"
  done
}
