# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds

pkgname=robotstxt
# No released version yet, so versioned based on the number of commits.
# Zeros to preserve numbering for any future version available.
pkgver=0.0.0.94
pkgrel=1
pkgdesc="Google's robots.txt parser and matcher as a C++ library (compliant to C++11)."
arch=('x86_64')
url="https://github.com/google/robotstxt"
license=('Apache')
depends=('gcc-libs')
makedepends=('cmake' 'git')
_git_commit='455b1583103d13ad88fe526bc058d6b9f3309215'
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/robotstxt/archive/$_git_commit.tar.gz")
sha256sums=('618cdd42d4662dcfc6ff2da25854cc0039e664df1a5caff7026acb4074c8e269')

build() {
  mkdir -p "$srcdir/robotstxt-$_git_commit/c-build"
  cd "$srcdir/robotstxt-$_git_commit/c-build"
  cmake .. \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  make
}

package() {
  install -dm0755 "$pkgdir/usr/bin"
  install -dm0755 "$pkgdir/usr/lib"

  install -m0644 "$srcdir/robotstxt-$_git_commit/c-build/librobots.so" "$pkgdir/usr/lib/librobots.so"
  install -m0755 "$srcdir/robotstxt-$_git_commit/c-build/robots" "$pkgdir/usr/bin/robotstxt"
}

check() {
  mkdir -p "$srcdir/robotstxt-$_git_commit/c-build"
  cd "$srcdir/robotstxt-$_git_commit/c-build"
  cmake .. \
    -DROBOTS_BUILD_TESTS=ON \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  make
  make test
}
