# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wdt-git
pkgver=1.27.1612021.r132.g1f43a96
pkgrel=1
pkgdesc="Tool to transfer data between 2 systems as fast as possible over multiple TCP paths"
arch=('i686' 'x86_64')
url="https://github.com/facebook/wdt"
license=('BSD')
depends=('glibc' 'bash' 'double-conversion' 'gflags' 'google-glog' 'openssl')
makedepends=('git' 'cmake' 'boost')
optdepends=('jemalloc')
checkdepends=('gtest')
provides=('wdt')
conflicts=('wdt')
source=("git+https://github.com/facebook/wdt.git")
sha256sums=('SKIP')


prepare() {
  cd "$srcdir"

  rm -rf "folly"
  git clone "https://github.com/facebook/folly.git"
  cd "folly"
  git checkout "$(git describe --abbrev=0 --always)"

  cd "$srcdir/wdt"
  mkdir -p "_build"
}

pkgver() {
  cd "wdt"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/wdt/_build"

  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release ../
  make
}

check() {
  cd "$srcdir/wdt/_build"

  #CTEST_OUTPUT_ON_FAILURE=1 make test
}

package() {
  cd "$srcdir/wdt/_build"

  make DESTDIR="$pkgdir" install
  install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/wdt/LICENSE"
}
