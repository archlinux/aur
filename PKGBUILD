# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Dario Ostuni <another.code.996@gmail.com>

pkgname=astc-encoder-git
pkgver=3.0.r0.gd21d551
pkgrel=1
pkgdesc='A tool for compressing and decompressing images using the ASTC texture compression standard (git version)'
arch=('x86_64')
url='https://github.com/ARM-software/astc-encoder/'
license=('Apache')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'python')
source=('git+https://github.com/ARM-software/astc-encoder.git#branch=main'
        'git+https://github.com/google/googletest.git'
        '010-astc-encoder-fix-install.patch')
sha256sums=('SKIP'
            'SKIP'
            '32cb972d67318166273e6ca508270630bf329f5e1855502f6a493cd803ab2447')

prepare() {
    git -C astc-encoder submodule init
    git -C astc-encoder config --local submodule.Source/GoogleTest.url "${srcdir}/googletest"
    git -C astc-encoder submodule update
    patch -d astc-encoder -Np1 -i "${srcdir}/010-astc-encoder-fix-install.patch"
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
    ln -s astcenc-sse2 "${pkgdir}/usr/bin/astcenc"
}
