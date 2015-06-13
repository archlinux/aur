# Maintainer: Kyle Keen <keenerd@gmail.com?>
pkgname=gnuradio-ra-blocks-svn
_pkgname=gr-ra_blocks
pkgver=r1248
pkgrel=1
pkgdesc="Essential radio astronomy tools for Gnuradio."
url="https://www.cgran.org/browser/projects/gr-ra_blocks"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gnuradio')
makedepends=('svn' 'cmake' 'boost' 'swig')
source=("svn+https://www.cgran.org/svn/projects/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/$_pkgname/trunk"
  sed -i 's/python$/python2/' python/*.py
  mkdir build
  cd build
  cmake \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DPYTHON_EXECUTABLE=$(which python2) \
    -DPYTHON_INCLUDE_DIR=$(echo /usr/include/python2*) \
    -DPYTHON_LIBRARY=$(echo /usr/lib/libpython2.*.so) \
    -DCMAKE_INSTALL_PREFIX=/usr ../
  make
}

package() {
  cd "$srcdir/$_pkgname/trunk/build"
  make DESTDIR="${pkgdir}" install
}
