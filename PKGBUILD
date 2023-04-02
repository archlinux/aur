# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Dario Ostuni <another.code.996@gmail.com>

pkgname=astc-encoder-git
pkgver=4.4.0.r3.gc9217e1
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
        'git+https://github.com/google/googletest.git')
sha256sums=('SKIP'
            'SKIP')

prepare() {
    git -C astc-encoder submodule init
    git -C astc-encoder config --local submodule.Source/GoogleTest.url "${srcdir}/googletest"
    git -C astc-encoder -c protocol.file.allow='always' submodule update
}

pkgver() {
    git -C astc-encoder describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S astc-encoder \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DSHAREDLIB:BOOL='ON' \
        -DISA_AVX2:BOOL='ON' \
        -DISA_SSE41:BOOL='ON' \
        -DISA_SSE2:BOOL='ON' \
        -DUNITTEST:BOOL='ON' \
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
    rm "${pkgdir}/usr/bin"/test-unit*
}
