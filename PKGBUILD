## Maintainer: Junchun Guan <junchunx.guan@gmail.com>
pkgname=python2-zypp
pkgver=0.6.4
pkgrel=1
pkgdesc="Python bindings for libzypp, the library for package management."
arch=('i686' 'x86_64')
url="https://github.com/openSUSE/libzypp-bindings"
license=('GPL')
depends=('libzypp-git')
makedepends=('git' 'cmake' 'boost' 'swig2')
provides=('libzypp-bindings')
conflicts=('libzypp-bindings')
source=('git+https://github.com/openSUSE/libzypp-bindings.git'
        '0001-Only-build-python-bindings.patch'
        'make-ZyppCommon-cmake-module-includable.patch')
md5sums=('SKIP'
         '72c3d6b918da81ec5ebcf0504e565da5'
         '71d063d865f99ac00ab24cf759107376')
_gitname="libzypp-bindings"

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git describe --always | sed -r 's/-/./g')
}

prepare() {
  cd "$srcdir/$_gitname"
  patch -p1 -i $srcdir/${source[1]}
  patch -p1 -i $srcdir/${source[2]}
}

build() {
  cd "$srcdir/$_gitname"
  cmake -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=Release \
    -D SWIG_EXECUTABLE=/usr/bin/swig-2 \
    -D PYTHON_EXECUTABLE=/usr/bin/python2 \
    -D LIB=/lib \
    -D ZYPP_PREFIX=/usr \
    -D CMAKE_VERBOSE_MAKEFILE=TRUE \
    .
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}
