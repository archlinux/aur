pkgname=zapcc-git
pkgver=r8.5d3778f1
pkgrel=1
pkgdesc="caching C++ compiler based on clang, designed to perform faster compilations"
arch=('i686' 'x86_64')
license=('custom:University of Illinois/NCSA Open Source License')
url="https://www.zapcc.com/"
provides=('zapcc')
conflicts=('zapcc')
depends=('ncurses')
makedepends=('git' 'cmake')
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
  install -d "$pkgdir"/usr/bin
  install -m755 ./bin/zapcc ./bin/zapccs "$pkgdir"/usr/bin
  install -m644 ./bin/zapccs.config "$pkgdir"/usr/bin
  cd "$pkgdir"/usr/bin && ln -s zapcc zapcc++
}
