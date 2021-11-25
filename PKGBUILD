# Modifications to use source from git master
# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>
# Contributor: Ranieri Althoff <ranisalt at protonmail dot com>

# Original Community Repo
# Maintainer: Baptiste Jonglez <archlinux at bitsofnetworks dot org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bart Verhagen <barrie.verhagen at gmail dot com>

pkgname=catch2-git
pkgver=3.0.0.preview3.r347.gdcf9479c
pkgrel=1
pkgdesc="Modern, C++-native, header-only, test framework for unit-tests, TDD and BDD (developmental version)"
arch=('x86_64')
url="https://github.com/catchorg/catch2"
license=('Boost')
makedepends=('cmake' 'python' 'git') # python seems to be necessary for building tests (FS#60273)
provides=("catch2=$pkgver")
conflicts=(catch2)
source=(
  "git+https://github.com/catchorg/Catch2"
  "0001-Remove-misguided-attempt-at-reproducibility-that-bre.patch"
)
sha256sums=('SKIP'
            '1c319512ac86acd50801cffc7be98939ef62fc571fe530ff29bedbbd6fc902c6')

pkgver() {
  cd Catch2

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

prepare() {
  cd Catch2

  patch -p1 < "$srcdir/0001-Remove-misguided-attempt-at-reproducibility-that-bre.patch"
}

build() {
  cmake -B build -S Catch2 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCATCH_USE_VALGRIND=OFF \
    -DCATCH_DEVELOPMENT_BUILD=ON \
    -DCATCH_BUILD_EXAMPLES=OFF \
    -DCATCH_ENABLE_COVERAGE=OFF \
    -DCATCH_ENABLE_WERROR=OFF \
    -DCATCH_BUILD_TESTING=ON
  make -C build
}

check() {
  make -C build test
}

package() {
  make -C build DESTDIR="$pkgdir" install
}

# vim: set et ts=2:
