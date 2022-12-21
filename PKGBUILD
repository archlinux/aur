# Maintainer: Michael Koloberdin <michael@koloberdin.com>
pkgname=mingw-w64-catch2v3
_gitcommit=ab6c7375be9a8e71ee84c6f8537113f9f47daf99
pkgver=3.2.1
pkgrel=2
pkgdesc="Modern, C++-native, header-only, test framework for unit-tests, TDD and BDD (v3) (mingw-w64)"
arch=('any')
_archs='i686-w64-mingw32 x86_64-w64-mingw32'
options=(!buildflags)
url="https://github.com/catchorg/Catch2/"
license=('Boost')
depends=('mingw-w64-crt')
makedepends=('git' 'mingw-w64-cmake')
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
  for _arch in ${_archs}; do
    ${_arch}-cmake -B "build-${_arch}" \
      -DCMAKE_INSTALL_PREFIX="/usr/${_arch}" \
      -DBUILD_SHARED_LIBS=OFF \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DCATCH_BUILD_EXAMPLES=OFF \
      -DCATCH_ENABLE_COVERAGE=OFF \
      -DCATCH_ENABLE_WERROR=OFF \
      -DBUILD_TESTING=ON
    cmake --build "build-${_arch}"
  done
}

package() {
  cd ${pkgname}
  for _arch in ${_archs}; do
    DESTDIR="$pkgdir" cmake --install "build-${_arch}"
  done
}
