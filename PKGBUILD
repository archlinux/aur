# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=astc-encoder
pkgver=5.2.0
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
sha256sums=('f3958db0459b09c40b1ea9393a12d00022a1208813083dddb3d076c1ff56937e'
            'SKIP'
            '92b879590c1a3c10cb52b314e7f763251f321bf2e29778882c48520982196053'
            'd364bdd68fe4126df2114a61d254bac85b66d612345ef1b19a940179e6dcbf4c')

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
