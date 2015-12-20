# Maintainer: archshift

_pkgbase=jucipp
pkgbase=$_pkgbase-git
pkgname=("$_pkgbase-git")
pkgdesc='A lightweight platform-independent C++ IDE'
pkgver=r1134.0837f6c
pkgrel=1

arch=('i686' 'x86_64')
url="https://github.com/cppit/jucipp"
license=('MIT')
depends=('gtksourceviewmm' 'clang' 'aspell')
makedepends=('git' 'cmake' 'pkg-config' 'boost')

source=("$_pkgbase::git+https://github.com/cppit/jucipp.git"
  "git+https://github.com/cppit/libclangmm.git"
  "git+https://github.com/eidheim/tiny-process-library"
  "CMakeLists.patch")
sha1sums=('SKIP' 'SKIP' 'SKIP' '64ac5afbe9a3a8b92cc3001897529834cda501a5')

pkgver() {
  cd "$srcdir/$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgbase"

  git submodule init
  git config submodule.libclangmm.url "$srcdir/libclangmm"
  git config submodule.tiny-process-library.url "$srcdir/tiny-process-library"
  git submodule update

  git apply "$srcdir/CMakeLists.patch"
  mkdir -p build
}

package_jucipp-git() {
  cd "$srcdir/$_pkgbase/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev ..

  make DESTDIR="$pkgdir" install
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
