# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=turbosqueeze-git
pkgver=r21.351e6ef
pkgrel=1
pkgdesc='Realtime Multithreaded Compression Library for C/C++ (git version)'
arch=('x86_64')
url='https://github.com/julienperriercornet/turbosqueeze/'
license=('MIT')
makedepends=(
    'cmake'
    'git')
provides=('turbosqueeze')
conflicts=('turbosqueeze')
source=('git+https://github.com/julienperriercornet/turbosqueeze.git')
sha256sums=('SKIP')

pkgver() {
    ( set -o pipefail
        git -C turbosqueeze describe --long --abbrev='7' 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
        printf 'r%s.%s' "$(git -C turbosqueeze rev-list --count HEAD)" "$(git -C turbosqueeze rev-parse --short='7' HEAD)"
    )
}

build() {
    # NOTE: <stdbit.h> C++ header is available only in C++26
    # https://en.cppreference.com/w/cpp/header/stdbit.h.html
    # https://github.com/julienperriercornet/turbosqueeze/blob/351e6efb0e5a48243a525457cccbe7daa72e5279/platform.h#L37
    
    cmake -B build -S turbosqueeze \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_CXX_STANDARD:STRING='26' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 build/libturbosqueeze.a -t "${pkgdir}/usr/lib"
    install -D -m644 turbosqueeze/turbosqueeze.h -t "${pkgdir}/usr/include"
    install -D -m644 turbosqueeze/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
