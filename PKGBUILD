# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Dario Ostuni <another.code.996@gmail.com>

pkgname=astc-encoder-git
pkgver=3.5.r0.g7e2a81e
pkgrel=1
pkgdesc='A tool for compressing and decompressing images using the ASTC texture compression standard (git version)'
arch=('x86_64')
url='https://github.com/ARM-software/astc-encoder/'
license=('Apache')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'python')
provides=('astc-encoder')
conflicts=('astc-encoder')
source=('git+https://github.com/ARM-software/astc-encoder.git#branch=main'
        'git+https://github.com/google/googletest.git'
        '010-astc-encoder-fix-install.patch'
        '020-astc-encoder-use-shared-library.patch')
sha256sums=('SKIP'
            'SKIP'
            '5f14b7a802b0548cdaa05238964d3a0181ea43961782500f7611e6ae9203bf92'
            '5507d79c2033b4258eed77e1498cf835a57b7a9d4b898100c4b1ceff2b230f73')

prepare() {
    git -C astc-encoder submodule init
    git -C astc-encoder config --local submodule.Source/GoogleTest.url "${srcdir}/googletest"
    git -C astc-encoder submodule update
    patch -d astc-encoder -Np1 -i "${srcdir}/010-astc-encoder-fix-install.patch"
    patch -d astc-encoder -Np1 -i "${srcdir}/020-astc-encoder-use-shared-library.patch"
}

pkgver() {
    git -C astc-encoder describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
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
