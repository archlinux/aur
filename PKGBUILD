# Maintainer: Cebtenzzre <cebtenzzre (at) gmail (dot) com>

_pkgname=blend2d
pkgname=${_pkgname}-git
pkgver=r87.592d1ba
pkgrel=1
pkgdesc='A high-performance 2D vector graphics engine written in C++'
url='https://blend2d.com'
arch=('i686' 'x86_64')
license=('custom:zlib')
depends=('glibc')
makedepends=('clang' 'cmake' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${_pkgname}::git+https://github.com/blend2d/blend2d"
        "asmjit::git+https://github.com/asmjit/asmjit")
sha1sums=('SKIP' 'SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"

  [[ -d build ]] && rm -rf build
  mkdir build && cd build

  # "It's strongly advised to use Clang to compile Blend2D on all platforms to achieve maximum performance."
  export CC='clang'
  export CXX='clang++'

  # Build a shared library with tests
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DASMJIT_DIR="$srcdir"/asmjit \
    -DBLEND2D_EMBED=FALSE \
    -DBLEND2D_STATIC=FALSE \
    -DBLEND2D_TEST=TRUE

  make
}

check() {
  cd "$_pkgname"/build
  ./bl_test_unit
}

package() {
  cd "$_pkgname"/build
  make DESTDIR="$pkgdir" install

  # Do not include the unit test program
  rm -rf "$pkgdir"/usr/bin

  install -Dm644 -t "$pkgdir"/usr/share/licenses/"$pkgname" ../LICENSE.md
}
