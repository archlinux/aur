# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gflags-git
pkgver=2.2.2.r40.ga386bd0
pkgrel=1
pkgdesc="C++ Library for commandline flag processing"
arch=('i686' 'x86_64')
url="https://github.com/gflags/gflags"
license=('BSD')
depends=('glibc')
makedepends=('git' 'cmake')
provides=('gflags')
conflicts=('gflags')
options=('staticlibs')
source=("git+https://github.com/gflags/gflags.git")
sha256sums=('SKIP')


pkgver() {
  cd "gflags"

  git describe --long --tags | sed 's/^[A-Za-z]*//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "gflags"

  cmake \
    -B "_build" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DREGISTER_INSTALL_PREFIX=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_STATIC_LIBS=ON \
    -DBUILD_TESTING=ON \
    ./
  make -C "_build"
}

check() {
  cd "gflags"

  make -C "_build" test
}

package() {
  cd "gflags"

  make -C "_build" DESTDIR="$pkgdir" install
  install -D -m644 "COPYING.txt" -t "$pkgdir/usr/share/licenses/gflags"
}
