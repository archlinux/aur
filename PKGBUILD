# Maintainer : Daniel Bermond < gmail-com: danielbermond >

pkgname=pthreadpool-git
pkgver=r56.6673a4c
pkgrel=2
pkgdesc='A pthread-based thread pool implementation for C/C++ (git version)'
arch=('i386' 'x86_64')
url='https://github.com/Maratyszcza/pthreadpool/'
license=('BSD')
depends=('glibc')
makedepends=('git' 'cmake' 'python' 'gtest')
provides=('pthreadpool')
conflicts=('pthreadpool')
source=('git+https://github.com/Maratyszcza/pthreadpool.git')
sha256sums=('SKIP')

pkgver() {
    cd pthreadpool
    
    # git, no tags available
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd pthreadpool
    
    cmake \
        -DBUILD_GMOCK:BOOL='OFF' \
        -DBUILD_GTEST:BOOL='OFF' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DPTHREADPOOL_BUILD_BENCHMARKS:BOOL='OFF' \
        -Wno-dev \
        .
    make
}

check() {
    cd pthreadpool
    
    make test
}

package() {
    cd pthreadpool
    
    make DESTDIR="$pkgdir" install
    
    rm "${pkgdir}/usr/include/fxdiv.h"
    
    # license
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
