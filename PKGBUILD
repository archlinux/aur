# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Dario Ostuni <another.code.996@gmail.com>

pkgname=astc-encoder-git
pkgver=4.8.0.r0.g0d6c904
pkgrel=1
pkgdesc='A tool for compressing and decompressing images using the ASTC texture compression standard (git version)'
arch=('x86_64')
url='https://github.com/ARM-software/astc-encoder/'
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'python')
provides=('astc-encoder')
conflicts=('astc-encoder')
source=('git+https://github.com/ARM-software/astc-encoder.git#branch=main'
        'git+https://github.com/google/googletest.git'
        '010-astc-encoder-remove-werror.patch'
        '020-astc-encoder-remove-flags-unsupported-by-gcc14.patch')
sha256sums=('SKIP'
            'SKIP'
            'fff998bd640aede9584b68d5f9cef9de785deef56ffc6d10fda6d112a6e649a2'
            '9d5773a29c2110fb9137471cd525701ddf95a7990a27e40b7d3e2cfd69719812')

prepare() {
    git -C astc-encoder submodule init
    git -C astc-encoder config --local submodule.Source/GoogleTest.url "${srcdir}/googletest"
    git -C astc-encoder -c protocol.file.allow='always' submodule update
    
    patch -d astc-encoder -Np1 -i "${srcdir}/010-astc-encoder-remove-werror.patch"
    patch -d astc-encoder -Np1 -i "${srcdir}/020-astc-encoder-remove-flags-unsupported-by-gcc14.patch"
}

pkgver() {
    git -C astc-encoder describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
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
