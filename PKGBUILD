# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libgav1-git
pkgver=0.16.3.r0.gac9e35a
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
        'git+https://github.com/abseil/abseil-cpp.git'
        'git+https://github.com/google/googletest.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
    mkdir -p libgav1/third_party
    ln -sf ../../abseil-cpp libgav1/third_party/abseil-cpp
    ln -sf ../../googletest libgav1/third_party/googletest
}

pkgver() {
    git -C libgav1 describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S libgav1 \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DLIBGAV1_ENABLE_SSE4_1:BOOL='OFF' \
        -DLIBGAV1_ENABLE_AVX2:BOOL='OFF' \
        -Wno-dev
    make -C build
}

check() {
    local _test
    while read -r -d '' _test
    do
        "$_test"
    done < <(find build -maxdepth 1 -type f -name '*_test' -executable -print0)
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
