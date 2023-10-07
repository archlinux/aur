# Maintainer: <dbermond@archlinux.org>

pkgname=pthreadpool-git
pkgver=0.1.r144.g4fe0e1e
pkgrel=1
pkgdesc='A portable thread pool implementation for C/C++ (git version)'
arch=('x86_64')
url='https://github.com/Maratyszcza/pthreadpool/'
license=('BSD')
depends=('glibc')
makedepends=('git' 'cmake' 'python' 'gtest')
provides=('pthreadpool')
conflicts=('pthreadpool')
source=('git+https://github.com/Maratyszcza/pthreadpool.git'
        'git+https://github.com/Maratyszcza/FXdiv.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    git -C pthreadpool describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S pthreadpool \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DPTHREADPOOL_BUILD_BENCHMARKS:BOOL='OFF' \
        -DFXDIV_SOURCE_DIR:STRING="${srcdir}/FXdiv" \
        -DGOOGLETEST_SOURCE_DIR:STRING='/usr/src/googletest' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    rm "${pkgdir}/usr/include/fxdiv.h"
    install -D -m644 pthreadpool/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
