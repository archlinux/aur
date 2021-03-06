# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor: George Eleftheriou <eleftg>
# Contributor: Xwang <xwaang1976@gmail.com>
 
_PkgName=SU2
pkgname=su2
pkgver=7.1.1
pkgrel=1
pkgdesc="An Open-Source Suite for Multiphysics Simulation and Design"
url="https://su2code.github.io"
license=('LGPL2.1')
depends=('openmpi' 'python')
makedepends=('gcc-fortran' 'swig')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/su2code/SU2/archive/v$pkgver.tar.gz")
sha256sums=('6ed3d791209317d5916fd8bae54c288f02d6fe765062a4e3c73a1e1c7ea43542')

prepare() {
  cd "$srcdir/$_PkgName-$pkgver"
  autoupdate -f
  autoreconf -if
  sed -i 's/LIB} ${bindir}/LIB} ${DESTDIR}${bindir}/g' SU2_PY/pySU2/Makefile.in
  export PYTHON_VERSION=$( ( python --version ) | awk '{print $2}' | cut -c -3 )
}

build() {
  cd "$srcdir/$_PkgName-$pkgver"
  ./configure --prefix=/usr --enable-mpi --enable-PY_WRAPPER
  make
}

package() {
  cd "$srcdir/$_PkgName-$pkgver"
  make DESTDIR="$pkgdir" install
  install -dm755 "$pkgdir/usr/lib/python${PYTHON_VERSION}/site-packages"
  cd "$pkgdir/usr/bin"
  mv SU2 -t "$pkgdir/usr/lib/python${PYTHON_VERSION}/site-packages"
}
