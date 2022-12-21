# Maintainer: Michael Koloberdin <michael@koloberdin.com>
pkgname=catch2v3
_gitcommit=ab6c7375be9a8e71ee84c6f8537113f9f47daf99
pkgver=3.2.1
pkgrel=3
pkgdesc="Modern, C++-native, header-only, test framework for unit-tests, TDD and BDD (v3)"
arch=('any')
url="https://github.com/catchorg/Catch2/"
license=('Boost')
makedepends=('git' 'cmake')
source=(${pkgname}::"git+https://github.com/catchorg/Catch2#commit=${_gitcommit}?signed")
sha512sums=('SKIP')
validpgpkeys=(
  E29C46F3B8A7502860793B7DECC9C20E314B2360 # Martin Hořeňovský
  81E70B717FFB27AFDB45F52090BBFF120F9C087B # Jozef Grajciar
)

pkgver() {
  cd ${pkgname}
  git describe --tags --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname}
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"
  cmake -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCATCH_BUILD_EXAMPLES=OFF \
    -DCATCH_ENABLE_COVERAGE=OFF \
    -DCATCH_ENABLE_WERROR=OFF \
    -DBUILD_TESTING=ON
  cmake --build build
}

package() {
  cd ${pkgname}
  DESTDIR="$pkgdir" cmake --install build
}
