# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libgav1
pkgver=0.16.3
pkgrel=1
pkgdesc='A main profile (0) and high profile (1) compliant AV1 decoder'
arch=('x86_64')
url='https://chromium.googlesource.com/codecs/libgav1/'
license=('Apache')
depends=('gcc-libs')
makedepends=('git' 'cmake')
_abseil_ver=20210324.0
_gtest_ver=1.10.0
source=("git+https://chromium.googlesource.com/codecs/libgav1#tag=v${pkgver}"
        "git+https://github.com/abseil/abseil-cpp.git#tag=${_abseil_ver}"
        "git+https://github.com/google/googletest.git#tag=release-${_gtest_ver}")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
    mkdir -p libgav1/third_party
    ln -sf ../../abseil-cpp libgav1/third_party/abseil-cpp
    ln -sf ../../googletest libgav1/third_party/googletest
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
