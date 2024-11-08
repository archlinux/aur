# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=astc-encoder
pkgver=5.0.0
pkgrel=1
pkgdesc='A tool for compressing and decompressing images using the ASTC texture compression standard'
arch=('x86_64')
url='https://github.com/ARM-software/astc-encoder/'
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'python')
source=("git+https://github.com/ARM-software/astc-encoder.git#tag=${pkgver}"
        'git+https://github.com/google/googletest.git'
        '010-astc-encoder-remove-werror.patch'
        '020-astc-encoder-remove-flags-unsupported-by-gcc14.patch')
sha256sums=('be4fa1e036120bf5a64dc50d0ea2cc9a557b6af173d82402939233f4004a9bc8'
            'SKIP'
            '92b879590c1a3c10cb52b314e7f763251f321bf2e29778882c48520982196053'
            'b9cec838c88995092076071fb4c85056470448163f4f3ca1b8f8385ab296fdf5')

prepare() {
    git -C astc-encoder submodule init
    git -C astc-encoder config --local submodule.Source/GoogleTest.url "${srcdir}/googletest"
    git -C astc-encoder -c protocol.file.allow='always' submodule update
    
    patch -d astc-encoder -Np1 -i "${srcdir}/010-astc-encoder-remove-werror.patch"
    patch -d astc-encoder -Np1 -i "${srcdir}/020-astc-encoder-remove-flags-unsupported-by-gcc14.patch"
}

build() {
    cmake -B build -S astc-encoder \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DASTCENC_SHAREDLIB:BOOL='ON' \
        -DASTCENC_ISA_AVX2:BOOL='ON' \
        -DASTCENC_ISA_SSE41:BOOL='ON' \
        -DASTCENC_ISA_SSE2:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir"  cmake --install build
    install -D -m644 astc-encoder/Source/astcenc.h -t "${pkgdir}/usr/include"
    ln -s astcenc-sse2 "${pkgdir}/usr/bin/astcenc"
    ln -s libastcenc-sse2-shared.so "${pkgdir}/usr/lib/libastcenc.so"
}
