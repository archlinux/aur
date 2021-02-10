# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=astc-encoder
pkgver=2.4
pkgrel=1
pkgdesc='A tool for compressing and decompressing images using the ASTC texture compression standard'
arch=('x86_64')
url='https://github.com/ARM-software/astc-encoder/'
license=('Apache')
depends=('gcc-libs')
makedepends=('git' 'cmake')
source=("git+https://github.com/ARM-software/astc-encoder.git#tag=${pkgver}"
        'git+https://github.com/google/googletest.git'
        '010-astc-encoder-fix-install.patch')
sha256sums=('SKIP'
            'SKIP'
            '9c08ae1075f8a1ccf08e0969126589f361a059f1789aa486f75eea0761ef580d')

prepare() {
    git -C astc-encoder submodule init
    git -C astc-encoder config --local submodule.Source/GoogleTest.url "${srcdir}/googletest"
    git -C astc-encoder submodule update
    patch -d astc-encoder -Np1 -i "${srcdir}/010-astc-encoder-fix-install.patch"
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
    ln -s astcenc-sse2 "${pkgdir}/usr/bin/astcenc"
}
