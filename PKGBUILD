pkgname=zapcc-git
pkgver=r3.51f37ca2
pkgrel=1
pkgdesc="caching C++ compiler based on clang, designed to perform faster compilations"
arch=('i686' 'x86_64')
license=('custom:University of Illinois/NCSA Open Source License')
url="https://www.zapcc.com/"
provides=('zapcc')
conflicts=('zapcc')
depends=('llvm')
makedepends=('git' 'llvm' 'cmake')
source=("git+https://github.com/yrnkrn/zapcc.git" gcc8.patch)
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/zapcc"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/zapcc"
  # https://bugzilla.redhat.com/show_bug.cgi?id=1540620
  patch -p1 -i "${srcdir}"/gcc8.patch
}

build() {
  cd "$srcdir/zapcc"
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DLLVM_ENABLE_WARNINGS=OFF ..
  make
}

package() {
  cd "$srcdir/zapcc/build"
  make DESTDIR="$pkgdir" install
}
