pkgname=zapcc-git
pkgver=r57.9bd04e761
pkgrel=1
pkgdesc="caching C++ compiler based on clang, designed to perform faster compilations"
arch=('x86_64')
license=('custom:University of Illinois/NCSA Open Source License')
url="https://www.zapcc.com/"
provides=('zapcc')
conflicts=('zapcc')
depends=('ncurses' 'zlib')
makedepends=('git' 'cmake' 'python')
source=("git+https://github.com/yrnkrn/zapcc.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/zapcc"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/zapcc"
}

build() {
  cd "$srcdir/zapcc"
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DLLVM_ENABLE_WARNINGS=OFF -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$srcdir/zapcc/build"
  # minimal install to avoid conflicts with llvm/clang packages
  for component in clang-headers zapcc zapccs
  do
    DESTDIR="$pkgdir" cmake -DCOMPONENT=${component} -P ./cmake_install.cmake
  done

  ( cd "$pkgdir" && mv usr/lib/clang usr/lib/zapcc )
}
