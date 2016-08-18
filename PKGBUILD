# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Manuel Mendez <mmendez534@gmail.com>

_pkgbase=include-what-you-use
pkgname="$_pkgbase-git"
pkgver=r591.f09b88a
pkgrel=1
pkgdesc="A tool for use with clang to analyze #includes in C and C++ source files"
url="http://code.google.com/p/include-what-you-use/"
license=('LLVM Release License')
arch=('i686' 'x86_64')
depends=('clang>=3.8' 'clang<3.9')
makedepends=('clang>=3.8' 'clang<3.9')
optdepends=('python: for the fix_includes.py script')
conflicts=("$_pkgbase")
provides=("$_pkgbase=0.6")

source=("$_pkgbase::git+https://github.com/include-what-you-use/include-what-you-use#branch=clang_3.8")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgbase"
  mkdir -p build
}

build() {
  cd "$srcdir/$_pkgbase/build"
  CC=clang CXX=clang++ cmake -DIWYU_LLVM_ROOT_PATH=/usr/lib -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/$_pkgbase/build"

  make DESTDIR="$pkgdir" install
  install -Dm755 ../fix_includes.py "$pkgdir/usr/bin/iwyu-fix_includes.py"
}

# vim:set ts=2 sw=2 et:
