# Maintainer: Kyle Keen <keenerd@gmail.com?>

pkgname=gnuradio-multi-rtl-git
_gitname=multi-rtl
pkgver=r43.cbc12d5 
pkgrel=1
pkgdesc="Multi-channel receiver with use of RTL-SDR dongles"
url="https://ptrkrysik.github.io/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gnuradio-osmosdr' 'python2-scipy')
makedepends=('git' 'cmake' 'boost' 'swig')
source=("git+https://github.com/ptrkrysik/multi-rtl.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  #git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_gitname"
  mkdir -p build
  cd build
  export PYTHON=python2
  cmake \
    -DPYTHON_EXECUTABLE=$(which python2) \
    -DPYTHON_INCLUDE_DIR=$(echo /usr/include/python2*) \
    -DPYTHON_LIBRARY=$(echo /usr/lib/libpython2.*.so) \
    -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev ../
  make
}

package() {
  cd "$_gitname/build"
  make DESTDIR="${pkgdir}" install
}
