# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=robotstxt
# 1.0.0 was tagged now, but it is not yet building, so keeping the pre-release versions so make sure we can still build it.
# Zeros to preserve numbering for any future version available.
pkgver=0.0.0.125
pkgrel=1
pkgdesc="Google's robots.txt parser and matcher as a C++ library (compliant to C++11)."
arch=('x86_64')
url="https://github.com/google/robotstxt"
license=('Apache-2.0')
depends=('abseil-cpp' 'glibc' 'libgcc' 'libstdc++')
makedepends=('cmake')
_git_commit='22b355ff855419e6a3ff8ff09c0ad7fdb17116f9'
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/robotstxt/archive/$_git_commit.tar.gz")
b2sums=('a6a4084393fd211d25a5512b3f9a53cb6f75481e0afef2cb96445fb7bad35ed6c3658ed0bc1efaaf928846000281354733c4312e16e8e3ced3af726fa9f7d32c')

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
  ls -lah "$srcdir/robotstxt-$_git_commit/c-build/"

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
