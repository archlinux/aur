# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=googletest-git
pkgver=1.8.1.r244.gd5932506
pkgrel=1
pkgdesc="Google's C++ test framework"
arch=('i686' 'x86_64')
url="https://github.com/google/googletest"
license=('BSD')
depends=('gcc-libs' 'sh')
makedepends=('git' 'cmake')
provides=('gmock' 'gtest')
conflicts=('gmock' 'gtest')
source=("git+https://github.com/google/googletest.git")
sha256sums=('SKIP')


pkgver() {
  cd "googletest"

  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"

  mkdir -p "build" && cd "build"
  cmake \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON \
    -Dgtest_build_tests=ON \
    ../"googletest"
  make

  # For g{test,mock}-config
  cd "$srcdir/googletest"
  autoreconf -fi
  ./configure --prefix="/usr"
  make
}

check() {
  cd "googletest"

  #make -C "$srcdir/build" test
}

package() {
  cd "$srcdir"

  make -C "build" DESTDIR="$pkgdir" install

  cd "$srcdir/googletest"
  install -Dm755 "googletest/scripts/gtest-config" -t "$pkgdir/usr/bin"
  install -Dm755 "googlemock/scripts/gmock-config" -t "$pkgdir/usr/bin"

  install -Dm644 "googletest/m4/gtest.m4" -t "$pkgdir/usr/share/aclocal"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/gtest/LICENSE"
}
