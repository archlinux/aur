# Contributor: Junchun Guan <junchunx.guan@gmail.com>
pkgbase=libzypp-bindings-git
pkgname=('python-zypp-git')
pkgver=r351.e12c570
pkgrel=1
pkgdesc="ZYpp bindings for scripting languages"
arch=('i686' 'x86_64')
url="https://github.com/openSUSE/libzypp-bindings"
license=(GPL)
depends=(libzypp-git)
makedepends=(git cmake boost swig python)
source=('git+https://github.com/openSUSE/libzypp-bindings.git'
  'make-ZyppCommon-cmake-module-includable.patch')
md5sums=('SKIP'
  '71d063d865f99ac00ab24cf759107376')
_gitname="libzypp-bindings"

pkgver() {
  cd ${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${_gitname}
  patch -p1 -i $srcdir/${source[1]}

  # https://github.com/openSUSE/libzypp-bindings/pull/21
  sed -i "s|PythonLibs_FIND_VERSION|NOPE|g" swig/CMakeLists.txt
}

build() {
  cd ${_gitname}
  cmake -D CMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_RUBY_BINDINGS=OFF \
    -DBUILD_PERL5_BINDINGS=OFF \
    -DLIB=/lib \
    -DCMAKE_VERBOSE_MAKEFILE=TRUE \
    .
  make
}

package_python-zypp-git() {
  depends=(libzypp-git python)
  provides=(python-zypp)
  conflicts=(python-zypp)
  cd ${_gitname}
  make DESTDIR="${pkgdir}" install
}
