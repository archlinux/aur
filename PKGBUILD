# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=libvolk-git
_gitname=volk
pkgver=v1.2.1.5.gc512eb8
pkgrel=1
pkgdesc="The Vector-Optimized Library of Kernels from Gnuradio"
arch=('i686' 'x86_64')
url="http://libvolk.org/"
license=('GPL3')
depends=('gcc-libs' 'boost-libs' 'orc' 'python2')
makedepends=('git' 'boost' 'cmake' 'python2-cheetah')
source=("git://github.com/gnuradio/volk.git")
md5sums=('SKIP')
conflicts=('libvolk')
provides=('libvolk')

# doxygen for docs

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "$srcdir/$_gitname"
  sed -i -e "s|#![ ]*/usr/bin/env python$|&2|" $(find ./ -name '*.py')
}

build() {
  export PYTHON=python2
  cd "$srcdir/$_gitname"

  mkdir -p build
  cd build
  cmake \
    -DPYTHON_EXECUTABLE=$(which python2) \
    -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev ../
  make
}

check() {
  cd "$srcdir/$_gitname/build"
  export PYTHON=python2
  if [[ "$CARCH" != "i686" ]]; then
    make test
  fi
}

package() {
  cd "$srcdir/$_gitname/build"
  make DESTDIR="$pkgdir" install
}
