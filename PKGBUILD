# Maintainer: Jonathon Fernyhough <jonathon+m2x+dev>

pkgname=zsync2-git
pkgver=2.0.0pre
pkgrel=1
pkgdesc="A file transfer program that's able to connect to rsync servers"
arch=("x86_64")
url="https://github.com/AppImage/zsync2"
license=("custom:Artistic")
depends=(curl)
makedepends=(cmake git gnutls openssl zlib)
source=(git+$url.git
        git+https://github.com/Taywee/args.git
        git+https://github.com/AppImage/cpr.git
        git+https://github.com/google/googletest.git)
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

pkgver() {
  cd ${pkgname/-git/}
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "2.0.0r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd ${pkgname/-git/}
  git submodule init
  git config submodule.lib/args.url   "$srcdir"/args
  git config submodule.lib/cpr.url    "$srcdir"/cpr
  git config submodule.lib/gtest.url  "$srcdir"/googletest
  git submodule update
}

build() {
  cd ${pkgname/-git/}

  mkdir -p build && cd build
  cmake .. -DUSE_SYSTEM_CURL=1 -DBUILD_CPR_TESTS=0 -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=None
  make
}

package() {
  cd ${pkgname/-git/}/build

  make DESTDIR="$pkgdir" install
  install -d "$pkgdir/usr/share/licenses/$pkgname"

  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
