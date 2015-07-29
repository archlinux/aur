# Contributor: Junchun Guan <junchunx.guan@gmail.com>
pkgname=python2-zypp
pkgver=BASE.SuSE.Code.13_1.Branch.47.g0baaf1d
pkgrel=1
pkgdesc="Python bindings for libzypp, the library for package management."
arch=('i686' 'x86_64')
url="https://github.com/openSUSE/libzypp-bindings"
license=('GPL')
depends=('libzypp-git')
makedepends=('git' 'cmake' 'boost' 'swig')
provides=('libzypp-bindings')
conflicts=('libzypp-bindings')
source=('git+https://github.com/openSUSE/libzypp-bindings.git'
        'make-ZyppCommon-cmake-module-includable.patch')
md5sums=('SKIP'
         '71d063d865f99ac00ab24cf759107376')
_gitname="libzypp-bindings"

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git describe --always | sed -r 's/-/./g')
}

prepare() {
  cd "$srcdir/$_gitname"
  patch -p1 -i $srcdir/${source[1]}
}

build() {
  cd "$srcdir/$_gitname"
  cmake -D CMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_RUBY_BINDINGS=OFF \
    -DBUILD_PERL5_BINDINGS=OFF \
    -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
    -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DLIB=/lib \
    -DCMAKE_VERBOSE_MAKEFILE=TRUE \
    .
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}

