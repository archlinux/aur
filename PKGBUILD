# Contributor: Junchun Guan <junchunx.guan@gmail.com>

pkgbase=libzypp-bindings-git
pkgname=('python-zypp' 'python2-zypp')
pkgver=r341.0baaf1d
pkgrel=1
pkgdesc="ZYpp bindings for scripting languages"
arch=('i686' 'x86_64')
url="https://github.com/openSUSE/libzypp-bindings"
license=('GPL')
depends=('libzypp-git')
makedepends=('git' 'cmake' 'boost' 'swig' 'python' 'python2')
provides=('libzypp-bindings')
conflicts=('libzypp-bindings')
source=('git+https://github.com/openSUSE/libzypp-bindings.git'
        'make-ZyppCommon-cmake-module-includable.patch')
md5sums=('SKIP'
         '71d063d865f99ac00ab24cf759107376')
_gitname="libzypp-bindings"

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"
  patch -p1 -i $srcdir/${source[1]}

  # https://github.com/openSUSE/libzypp-bindings/pull/21
  sed -i "s|PythonLibs_FIND_VERSION|NOPE|g" swig/CMakeLists.txt
}

build() {
  cp -r "$srcdir"/$_gitname "$srcdir"/$_gitname-py2

  cd "$srcdir"/$_gitname
  cmake -D CMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_RUBY_BINDINGS=OFF \
    -DBUILD_PERL5_BINDINGS=OFF \
    -DLIB=/lib \
    -DCMAKE_VERBOSE_MAKEFILE=TRUE \
    .
  make
  cd "$srcdir"/$_gitname-py2
  cmake -D CMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_RUBY_BINDINGS=OFF \
    -DBUILD_PERL5_BINDINGS=OFF \
    -DPythonLibs_FIND_VERSION_MAJOR=2 \
    -DPythonLibs_FIND_VERSION=2.7 \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DLIB=/lib \
    -DCMAKE_VERBOSE_MAKEFILE=TRUE \
    .
  make
}

package_python-zypp() {
  depends=('libzypp-git' 'python')
  cd "$srcdir"/$_gitname
  make DESTDIR="${pkgdir}" install
}

package_python2-zypp() {
  depends=('libzypp-git' 'python2')
  cd "$srcdir"/$_gitname-py2
  make DESTDIR="${pkgdir}" install
}
