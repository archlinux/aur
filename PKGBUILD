# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libgav1-git
pkgver=0.16.0.r217.g2af099d
pkgrel=1
pkgdesc='A main profile (0) and high profile (1) compliant AV1 decoder (git version)'
arch=('x86_64')
url='https://chromium.googlesource.com/codecs/libgav1/'
license=('Apache')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=('libgav1')
conflicts=('libgav1')
source=('git+https://chromium.googlesource.com/codecs/libgav1'
        'git+https://github.com/abseil/abseil-cpp.git')
sha256sums=('SKIP'
            'SKIP')

prepare() {
    mkdir -p libgav1/third_party
    ln -sf ../../abseil-cpp libgav1/third_party/abseil-cpp
}

pkgver() {
    git -C libgav1 describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S libgav1 \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DLIBGAV1_ENABLE_SSE4_1:BOOL='OFF' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
