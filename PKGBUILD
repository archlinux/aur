# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=folly-git
pkgver=r1110.81e0e45
pkgrel=1
pkgdesc='Folly is an open-source C++ library developed and used at Facebook'
arch=(i686 x86_64)
url='https://github.com/facebook/folly'
license=(Apache)
depends=(google-glog gflags double-conversion libevent xz boost-libs jemalloc lz4)
makedepends=(git boost python2)
source=(
  git+https://github.com/facebook/folly.git
  http://googletest.googlecode.com/files/gtest-1.6.0.zip
)
# that sucks that the project downloads gtests sources, it should use system libraries
# https://github.com/facebook/folly/issues/48
md5sums=('SKIP'
         '4577b49f2973c90bf9ba69aa8166b786')

pkgver() {
  cd folly
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd folly/folly
  find -name '*.py' -exec sed -i 's|^#!/usr/bin/env python$|#!/usr/bin/env python2|' {} \;

  cd test
  ln -s "$srcdir"/gtest-1.6.0
}

build() {
  CPPFLAGS="$CPPFLAGS -I/usr/include/double-conversion"

  cd folly/folly
  autoreconf --install
  # disable shared libs as double-conversion does not have shared libs
  ./configure --prefix=/usr --enable-shared
  make
}

package() {
  cd folly/folly
  make DESTDIR="$pkgdir" install
}

