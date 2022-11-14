# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=avm
pkgver=3.1.0
pkgrel=1
pkgdesc='AOM Video Model - the reference software for next codec from Alliance for Open Media'
arch=('x86_64')
url='https://gitlab.com/AOMediaCodec/avm/'
license=('BSD')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'yasm' 'perl')
provides=('libaom.so')
conflicts=('aom')
BUILDENV+=('!check')
source=("git+https://gitlab.com/AOMediaCodec/avm.git#tag=research-v${pkgver}"
        'git+https://github.com/tensorflow/tensorflow.git')
sha256sums=('SKIP'
            'SKIP')

prepare() {
    git -C avm submodule init
    git -C avm config --local submodule.third_party/tensorflow.url "${srcdir}/tensorflow"
    git -C avm -c protocol.file.allow='always' submodule update
}

build() {
    cmake -B build -S avm \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DENABLE_DOCS:BOOL='OFF' \
        -DENABLE_TESTS:BOOL='OFF' \
        -DENABLE_AVX:BOOL='OFF' \
        -DENABLE_AVX2:BOOL='OFF' \
        -DENABLE_SSE3:BOOL='OFF' \
        -DENABLE_SSSE3:BOOL='OFF' \
        -DENABLE_SSE4_1:BOOL='OFF' \
        -DENABLE_SSE4_2:BOOL='OFF' \
        -DHAVE_MMX:STRING='1' \
        -DHAVE_SSE:STRING='1' \
        -DHAVE_SSE2:STRING='1' \
        -Wno-dev
    make -C build
}

check() {
    LIBAOM_TEST_DATA_PATH="${PWD}/testdata" make -C build runtests
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 avm/{LICENSE,PATENTS} -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
