# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=astc-codec-git
pkgver=r22.g9757bef
pkgrel=2
pkgdesc='A software ASTC decoder implementation which supports the ASTC LDR profile (git version)'
arch=('x86_64')
url='https://github.com/google/astc-codec/'
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=('astc-codec')
conflicts=('astc-codec')
source=('git+https://github.com/google/astc-codec.git'
        'git+https://github.com/google/googletest.git'
        '010-astc-codec-fix-shared-build.patch'
        '020-astc-codec-use-local-googletest-sources.patch')
sha256sums=('SKIP'
            'SKIP'
            '79e77b104c82b5058b2f34549b51a4df901c8e34669f6dcf7b3074e99e842d2b'
            '56b1fe56757b4af06407ace488a9ebf0242b5f7607e8a7f5b8cf7226deca4797')

prepare() {
    patch -d astc-codec -Np1 -i "${srcdir}/010-astc-codec-fix-shared-build.patch"
    patch -d astc-codec --binary -Np1 -i "${srcdir}/020-astc-codec-use-local-googletest-sources.patch"
}

pkgver() {
    printf 'r%s.g%s' "$(git -C astc-codec rev-list --count HEAD)" "$(git -C astc-codec rev-parse --short HEAD)"
}

build() {
    cmake -B build -S astc-codec \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DCMAKE_SKIP_RPATH:BOOL='YES' \
        -Wno-dev
    cmake --build build
}

check() {
    export LD_LIBRARY_PATH="${srcdir}/build/src/decoder"
    export LD_LIBRARY_PATH+=":${srcdir}/build/googletest-build/googlemock"
    export LD_LIBRARY_PATH+=":${srcdir}/build/googletest-build/googlemock/gtest"
    ctest --test-dir build --output-on-failure
}

package() {
    install -d -m755 "${pkgdir}/usr/include"
    cp -dr --no-preserve='ownership' astc-codec/include/astc-codec "${pkgdir}/usr/include"
    install -D -m755 build/src/decoder/astc_inspector_cli -t "${pkgdir}/usr/bin"
    install -D -m644 build/src/decoder/lib*.so -t "${pkgdir}/usr/lib"
}
