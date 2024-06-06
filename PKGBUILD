# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=robotstxt
# No released version yet, so versioned based on the number of commits.
# Zeros to preserve numbering for any future version available.
pkgver=0.0.0.102
pkgrel=1
pkgdesc="Google's robots.txt parser and matcher as a C++ library (compliant to C++11)."
arch=('x86_64')
url="https://github.com/google/robotstxt"
license=('Apache')
depends=('gcc-libs')
makedepends=('cmake' 'git')
_git_commit='a732377373e8bbee9f720b52020e2a8d5dd19cf8'
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/robotstxt/archive/$_git_commit.tar.gz")
b2sums=('cff58ea5b7c016d5aa69ccfd234041571eb692e64caf2b52044f32332b40bd0e084d201580f7374af94aae1a50c478567de795269ccb10684d0a275cb51a4ba7')

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
