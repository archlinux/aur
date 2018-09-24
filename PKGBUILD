# Maintainer: Jean-Luc Tambasco <an.obscurity@gmail.com>
_srcname=S4
pkgname=s4-git
pkgver=r187.1a5bd64
pkgrel=1
pkgdesc="S4 (or simply S4) stands for Stanford Stratified Structure Solver, a frequency domain code to solve the linear Maxwell’s equations in layered periodic structures."
arch=('i686' 'x86_64')
url=""
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
source=('S4::git+https://github.com/kwrobert/S4#branch=master')
noextract=()
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$_srcname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_srcname"

  sed -i '/pip3/d' ./Makefile

  make clean
  make
  make S4_pyext
  python setup.py build
}

package() {
  cd "$srcdir/$_srcname"

  install -Dm644 "build/libS4.a" "$pkgdir/usr/lib/libS4.a"

  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
