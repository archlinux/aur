# Maintainer: Kyle Keen <keenerd@gmail.com?>
pkgname=gnuradio-ra-blocks-git
_pkgname=gr-ra_blocks
# old pkgver at r1248
pkgver=20150623
pkgrel=1
pkgdesc="Essential radio astronomy tools for Gnuradio."
url="https://github.com/patchvonbraun/gr-ra_blocks"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gnuradio')
makedepends=('git' 'cmake' 'boost' 'swig')
source=("git+https://github.com/patchvonbraun/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  #echo "r$(git rev-list HEAD --count)"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd "$srcdir/$_pkgname"
  sed -i 's/python$/python2/' python/*.py
  mkdir -p build
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
  cd "$srcdir/$_pkgname/build"
  make DESTDIR="${pkgdir}" install
}
