# Modifications to use source from git master
# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>
# Contributor: Ranieri Althoff <ranisalt at protonmail dot com>

# Original Community Repo
# Maintainer: Baptiste Jonglez <archlinux at bitsofnetworks dot org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bart Verhagen <barrie.verhagen at gmail dot com>

pkgname=catch2-git
pkgver=3.0.0.preview4.r48.g81f612c9
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
  "0002-ApprovalTests-fix-path-rewriting-for-debug-builds.patch"
)
sha256sums=('SKIP'
            '6bf9e7322a4a4399b483118e4c5bea1a0a214aca5938f687cf2f44bfb7b9b3fe'
            '8c25aa44ad638eed275190c2850ede73c626ecabf4d8bd176e8d707d04c4a74a')

pkgver() {
  cd Catch2

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

prepare() {
  cd Catch2

  patch -p1 < "$srcdir/0001-Remove-misguided-attempt-at-reproducibility-that-bre.patch"
  patch -p1 < "$srcdir/0002-ApprovalTests-fix-path-rewriting-for-debug-builds.patch"
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
  # dbgsrcdir needs to be passed to the testsuite, since it does some pathname mangling that is
  # broken by -ffile-prefix-map - see 0002-ApprovalTests-fix-path-rewriting-for-debug-builds.patch
  dbgsrcdir="${DBGSRCDIR:-/usr/src/debug}" make -C build test
}

package() {
  make -C build DESTDIR="$pkgdir" install
}

# vim: set et ts=2:
