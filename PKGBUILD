# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=avm
pkgver=8.1.0
pkgrel=1
pkgdesc='AOM Video Model - the reference software for next codec from Alliance for Open Media'
arch=('x86_64')
url='https://gitlab.com/AOMediaCodec/avm/'
license=('BSD-3-Clause')
depends=('gcc-libs')
makedepends=(
    'git'
    'cmake'
    'yasm'
    'perl'
    #'python' # for tests
)
provides=('libaom.so')
conflicts=('aom')
source=("git+https://gitlab.com/AOMediaCodec/avm.git#tag=research-v${pkgver}"
        'git+https://github.com/abseil/abseil-cpp.git')
sha256sums=('91727d5a2b82785448b1993e8eb231968109da562c2f087165bd815a16c10b41'
            'SKIP')

prepare() {
    git -C avm submodule init
    git -C avm config --local submodule.third_party/abseil-cpp.url "${srcdir}/abseil-cpp"
    git -C avm -c protocol.file.allow='always' submodule update
}

build() {
    # set ENABLE_TESTS to ON for tests
    cmake -B build -S avm \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DENABLE_DOCS:BOOL='OFF' \
        -DENABLE_EXAMPLES:BOOL='OFF' \
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
    cmake --build build
}

# uncomment for tests (takes an extraordinary long time to run)
#check() {
#    export LIBAOM_TEST_DATA_PATH="${srcdir}/testdata"
#    cmake --build build --target testdata runtests
#}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 avm/{LICENSE,PATENTS} -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
