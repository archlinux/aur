# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=('llvm-mos-git')
_pkgname=${pkgname%-git}
pkgver=r452222.b05db96bef68
pkgrel=1
arch=('x86_64')
url="https://llvm-mos.org/wiki/Welcome"
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=('cmake' 'ninja')
options=('staticlibs' '!lto') # Getting thousands of test failures with LTO
source=(git+https://github.com/llvm-mos/llvm-mos.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  cmake \
    -S llvm \
    -G Ninja \
    -C clang/cmake/caches/MOS.cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/opt/llvm-mos \
  .

  ninja
}

check() {
  cd "$srcdir/$_pkgname"
  echo "No testing.. takes too long.."
}

package() {
  cd "$srcdir/$_pkgname"

  DESTDIR="$pkgdir" ninja install
}
