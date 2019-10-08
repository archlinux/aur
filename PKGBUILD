# Maintainer : Daniel Bermond <dbermond@archlinux.org>

pkgname=libgav1-git
pkgver=r5.g2db0515
pkgrel=1
pkgdesc='A profile 0 and 1 compliant AV1 decoder by Google (git version)'
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
    mkdir -p libgav1/{build,third_party}
    ln -sf "${srcdir}/abseil-cpp" libgav1/third_party/abseil-cpp
}

pkgver() {
    cd libgav1
    printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd libgav1/build
    cmake \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DLIBGAV1_ENABLE_SSE4_1:BOOL='OFF' \
        -Wno-dev \
        ..
    make
}

package() {
    cd libgav1/build
    make DESTDIR="$pkgdir" install
}
