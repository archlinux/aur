# Maintainer: Bartkk <bartkk@bartkk.xyz>

pkgname=dbus-cxx-git
pkgver=20251219.98cc097
pkgrel=1
pkgdesc="Object-oriented DBus interface library"
arch=(x86_64)
url="https://dbus-cxx.github.io/"
license=('LGPL-3.0-or-later')
depends=('libsigc++-3.0' 'glibc' 'gcc-libs')
source=('git+https://github.com/dbus-cxx/dbus-cxx.git')
makedepends=('git' 'cmake')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/dbus-cxx"
    git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
    local cmake_options=(
        -B build
        -S "$srcdir/dbus-cxx"
        -W no-dev
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

check() {
    local excluded_tests=""
    local ctest_flags=(
        --test-dir build
        # show the stdout and stderr when the test fails
        --output-on-failure
        # execute tests in parallel
        --parallel $(nproc)
        # exclude problematic tests
        --exclude-regex "$excluded_tests"
    )
    ctest "${ctest_flags[@]}"
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
