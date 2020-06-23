# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

_pkgname=CPPurses
pkgname=cppurses
pkgver=0.3
pkgrel=2
pkgdesc="C++14 Terminal User Interface framework with NCurses."
arch=('x86_64')
url="https://github.com/a-n-t-h-o-n-y/CPPurses"
license=('custom:MIT')
depends=()
makedepends=('ncurses' 'cmake' 'git')
source=("${url}/archive/v$pkgver.tar.gz")
sha256sums=('a23bde3e9f26d44d3abe38eaf9937da5d6a87f7e2f1d8b2cce3c9d9d6f16d3e9')

prepare() {
    cd "$_pkgname-$pkgver"
    git clone --recurse-submodules --single-branch --branch cppurses_master \
        https://github.com/a-n-t-h-o-n-y/Signals libs/Signals
    git clone https://github.com/a-n-t-h-o-n-y/Chess-curses demos/chess
    cd demos/chess
    git checkout f597add641463b5aeb7382d4f804f5c4e6df69d5
    cd ../..

    cmake -H. -Bbuild \
      -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
      -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr
}

build() {
    cd "$_pkgname-$pkgver"
    cmake --build build
}

check() {
    cd "$_pkgname-$pkgver"
    # no tests atm
    # cmake --build build -- check
}

package() {
    cd "$_pkgname-$pkgver"
    cmake --build build -- DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: set softtabstop=4 shiftwidth=4 expandtab:
