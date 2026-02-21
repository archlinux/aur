# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=robotstxt
# No released version yet, so versioned based on the number of commits.
# Zeros to preserve numbering for any future version available.
# 1.0.0 was tagged now, but it is not yet building.
pkgver=0.0.0.118
pkgrel=1
pkgdesc="Google's robots.txt parser and matcher as a C++ library (compliant to C++11)."
arch=('x86_64')
url="https://github.com/google/robotstxt"
license=('Apache')
depends=('abseil-cpp')
makedepends=('cmake')
_git_commit='ba8fa30e5be8b556e233782f91710919eb1f935f'
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/robotstxt/archive/$_git_commit.tar.gz")
b2sums=('70036ff8d9e08bd0b511438f571cc21d8fccd5a598eaa645c4f47e6373af73678e2f82c061094cfd561e7df80ba5d28e6bd7b5c395fc51dcd1a59fc659518ae8')

build() {
  mkdir -p "$srcdir/robotstxt-$_git_commit/c-build"
  cd "$srcdir/robotstxt-$_git_commit/c-build"
  cmake .. \
    -DCMAKE_BUILD_TYPE='None' \
    -DROBOTS_SKIP_DEPS=ON \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
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
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  make
  make test
}
