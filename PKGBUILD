# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor: George Eleftheriou <eleftg>
# Contributor: Xwang <xwaang1976@gmail.com>
 
_PkgName=SU2
pkgname=su2
pkgver=7.2.1
pkgrel=1
pkgdesc="An Open-Source Suite for Multiphysics Simulation and Design"
url="https://su2code.github.io"
license=('LGPL2.1')
depends=('python-mpi4py')
makedepends=('gcc-fortran' 'swig')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/su2code/SU2/archive/v$pkgver.tar.gz"
        "su2.sh")
sha256sums=('4b4580136c4f686791a3e973d7b6a4a589cb329b2bc4232fa6be57a56de65cae'
            'ff2123f09f5be843dae935b355d92d39bb1c264cbc8dc5de08168f1c84fe3881')

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
  install -Dm755 "$srcdir/su2.sh" -t "$pkgdir/etc/profile.d"
}
