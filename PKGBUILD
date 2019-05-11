# Modifications to use source from git master
# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>
# Contributor: Ranieri Althoff <ranisalt at protonmail dot com>

# Original Community Repo
# Maintainer: Baptiste Jonglez <archlinux at bitsofnetworks dot org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bart Verhagen <barrie.verhagen at gmail dot com>

pkgname=catch2-git
pkgver=2.7.2.r25.gf1e14a11
pkgrel=1
pkgdesc="Modern, C++-native, header-only, test framework for unit-tests, TDD and BDD (developmental version)"
arch=('any')
url="https://github.com/catchorg/catch2"
license=('Boost')
makedepends=('cmake' 'python' 'git') # python seems to be necessary for building tests (FS#60273)
provides=(catch2)
conflicts=(catch2)
source=("git+https://github.com/catchorg/Catch2")
sha256sums=('SKIP')

pkgver() {
  cd Catch2

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

build() {
  cd Catch2

  mkdir -p build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCATCH_USE_VALGRIND=OFF \
    -DCATCH_BUILD_EXAMPLES=OFF \
    -DCATCH_ENABLE_COVERAGE=OFF \
    -DCATCH_ENABLE_WERROR=OFF \
    -DBUILD_TESTING=ON
  make
}

check() {
  cd Catch2/build
  make test
}

package() {
  cd Catch2/build
  make DESTDIR="$pkgdir" install
}
