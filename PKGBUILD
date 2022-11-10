# Modifications to use source from git master
# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>
# Contributor: Ranieri Althoff <ranisalt at protonmail dot com>

# Original Community Repo
# Maintainer: Baptiste Jonglez <archlinux at bitsofnetworks dot org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bart Verhagen <barrie.verhagen at gmail dot com>

pkgname=catch2-git
pkgver=3.1.1.r45.gb65c0e27
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
            'd26bd252d163e4648217c942bc5a9ac36edba6a151759edd57597ae437866d8e'
            '72fd49a773699f85eb0954074231c9229ee442c58e2c4e476c25d4ce2328381b')

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
  dbgsrcdir="${DBGSRCDIR:-/usr/src/debug}/$pkgbase" make -C build test
}

package() {
  make -C build DESTDIR="$pkgdir" install
}

# vim: set et ts=2:
