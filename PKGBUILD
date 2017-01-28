# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=folly-git
pkgver=2016.12.19.00.r112.g0ea1868e
pkgrel=1
pkgdesc='Folly is an open-source C++ library developed and used at Facebook'
arch=(i686 x86_64)
url='https://github.com/facebook/folly'
license=(Apache)
conflicts=(folly)
provides=(folly)
replaces=(folly)
depends=(google-glog gflags double-conversion libevent boost-libs jemalloc xz lz4 zstd snappy)
makedepends=(git boost python2)
source=(
  git+https://github.com/facebook/folly.git
  gtest-1.7.0.zip::https://github.com/google/googletest/archive/release-1.7.0.zip
)
# that sucks that the project downloads gtests sources, it should use system libraries
# https://github.com/facebook/folly/issues/48
md5sums=('SKIP'
         'ef5e700c8a0f3ee123e2e0209b8b4961')

pkgver() {
  cd folly
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd folly/folly
  find -name '*.py' -exec sed -i 's|^#!/usr/bin/env python$|#!/usr/bin/env python2|' {} \;

  cd test
  ln -sf $srcdir/googletest-release-1.7.0 gtest-1.7.0
}

build() {
  CPPFLAGS="$CPPFLAGS -I/usr/include/double-conversion"

  cd folly/folly
  autoreconf --install
  # disable shared libs as double-conversion does not have shared libs
  ./configure --prefix=/usr # --enable-shared
  make
}

package() {
  cd folly/folly
  make DESTDIR="$pkgdir" install
}

