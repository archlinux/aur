# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=astc-encoder
pkgver=3.3
pkgrel=1
pkgdesc='A tool for compressing and decompressing images using the ASTC texture compression standard'
arch=('x86_64')
url='https://github.com/ARM-software/astc-encoder/'
license=('Apache')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'python')
source=("git+https://github.com/ARM-software/astc-encoder.git#tag=${pkgver}"
        'git+https://github.com/google/googletest.git'
        '010-astc-encoder-fix-install.patch'
        '020-astc-encoder-use-shared-library.patch')
sha256sums=('SKIP'
            'SKIP'
            '5f14b7a802b0548cdaa05238964d3a0181ea43961782500f7611e6ae9203bf92'
            'a2f0c20dc8f08c3d8704721e5d6e8462eacf03a7399de7733452e47a9368001f')

prepare() {
    git -C astc-encoder submodule init
    git -C astc-encoder config --local submodule.Source/GoogleTest.url "${srcdir}/googletest"
    git -C astc-encoder submodule update
    patch -d astc-encoder -Np1 -i "${srcdir}/010-astc-encoder-fix-install.patch"
    patch -d astc-encoder -Np1 -i "${srcdir}/020-astc-encoder-use-shared-library.patch"
}

build() {
    cmake -B build -S astc-encoder \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DISA_AVX2:BOOL='ON' \
        -DISA_SSE41:BOOL='ON' \
        -DISA_SSE2:BOOL='ON' \
        -DUNITTEST:BOOL='ON' \
        -Wno-dev
    make -C build
}

check() {
    make -C build test
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 astc-encoder/Source/astcenc.h -t "${pkgdir}/usr/include"
    ln -s astcenc-sse2 "${pkgdir}/usr/bin/astcenc"
    ln -s libastcenc-sse2.so "${pkgdir}/usr/lib/libastcenc.so"
}
