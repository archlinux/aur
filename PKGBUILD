# Maintainer: Jean-Luc Tambasco <an.obscurity@gmail.com>
_srcname=S4
pkgname=s4-git
pkgver=r206.7fd00a2
pkgrel=1
pkgdesc="S4 (or simply S4) stands for Stanford Stratified Structure Solver, a frequency domain code to solve the linear Maxwell’s equations in layered periodic structures."
arch=('i686' 'x86_64')
url="https://web.stanford.edu/group/fan/S4/#"
license=('GPL')
groups=()
depends=('lua>=5.2.0' 'python3' 'openblas' 'fftw' 'suitesparse' 'openmpi')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('S4::git+https://github.com/victorliu/S4#branch=master')
noextract=()
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$_srcname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_srcname"

  # Pthreads
  sed -i '/^CXXFLAGS/ s@$@ -DHAVE_UNISTD_H -lpthread@' ./Makefile.Linux

  # CHOLDMOD
  sed -i '/^CXXFLAGS/ s@$@ -DHAVE_LIBCHOLMOD -I/usr/include/suitesparse -lcholmod -lamd -lcolamd -lcamd -lccolamd@' ./Makefile.Linux

  # FFTW3
  sed -i '/^CXXFLAGS/ s@$@ -DHAVE_FFTW3 -lfftw3@' ./Makefile.Linux

  make
}

package() {
  cd "$srcdir/$_srcname"

  install -d "$pkgdir/usr/lib"
  install -d "$pkgdir/usr/bin"

  install -Dm644 build/*.so "$pkgdir/usr/lib"
  install -Dm644 build/*.a "$pkgdir/usr/lib"
  install -Dm755 build/S4 "$pkgdir/usr/bin"
}
