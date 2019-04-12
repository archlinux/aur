# Maintainer: Spyhawk

pkgname=libsolv-arch-git
pkgver=0.7.4
pkgrel=1
pkgdesc="A new approach to package dependency solving (Arch Linux support only)"
arch=('i686' 'x86_64')
url="https://github.com/openSUSE/libsolv"
license=('BSD')
makedepends=('git' 'make' 'cmake' 'expat' 'swig'
             'perl' 'python' 'ruby')
optdepends=('perl: for perl bindings'
            'python: for python bindings'
            'ruby: for ruby bindings')
provides=('libsolv')
conflicts=('libsolv')
source=('git+https://github.com/openSUSE/libsolv.git')
md5sums=('SKIP')
_gitname="libsolv"

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git describe --always | sed -r 's/-/./g')
}

build() {
  cd "$srcdir/$_gitname"

  cmake -D CMAKE_INSTALL_PREFIX=/usr \
    -D ARCHLINUX=1 \
    -D ENABLE_PERL=1 \
    -D ENABLE_PYTHON=1 \
    -D ENABLE_RUBY=1 \
    .
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install

  # cmake fix (see GH#56)
  mkdir -p $pkgdir/usr/lib/cmake/LibSolv
  mv $pkgdir/usr/share/cmake/Modules/FindLibSolv.cmake $pkgdir/usr/lib/cmake/LibSolv/LibSolvConfig.cmake

  # hacky lib64 symlink fix
  mv $pkgdir/usr/lib64/* $pkgdir/usr/lib/
  rmdir $pkgdir/usr/lib64
}

