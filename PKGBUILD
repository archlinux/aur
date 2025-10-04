# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=avm
pkgver=11.0.0
pkgrel=1
pkgdesc='AOM Video Model - the reference software for next codec from Alliance for Open Media'
arch=('x86_64')
url='https://gitlab.com/AOMediaCodec/avm/'
license=('BSD-3-Clause')
depends=(
    'glibc')
makedepends=(
    'cmake'
    'git'
    'perl'
    #'python' # for tests
    'yasm')
provides=('libaom.so')
conflicts=('aom')
source=("git+https://gitlab.com/AOMediaCodec/avm.git#tag=research-v${pkgver}"
        'git+https://github.com/abseil/abseil-cpp.git')
sha256sums=('7d93802484ca961917134080ccfdc682b01991d22d842d19d618b0d57acd59ef'
            'SKIP')

prepare() {
    git -C avm submodule init
    git -C avm config --local submodule.third_party/abseil-cpp.url "${srcdir}/abseil-cpp"
    git -C avm -c protocol.file.allow='always' submodule update
    
    # abseil-cpp: fix build with gcc 15
    # https://github.com/abseil/abseil-cpp/commit/809e5de7b92950849289236a5a09e9cb4f32c7b9
    git -C avm/third_party/abseil-cpp cherry-pick --no-commit 809e5de7b92950849289236a5a09e9cb4f32c7b9
}

build() {
    # NOTE: set ENABLE_TESTS to ON for tests
    # NOTE: disabled DIP_EXT_PRUNING and ML_PART_SPLIT to avoid dependency on libtensorflow-lite (heavy)
    cmake -B build -S avm \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_POLICY_VERSION_MINIMUM:STRING='3.5' \
        -DCONFIG_DIP_EXT_PRUNING:STRING='0' \
        -DCONFIG_ML_PART_SPLIT:STRING='0' \
        -DCONFIG_TENSORFLOW_LITE:STRING='0' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DENABLE_DOCS:BOOL='OFF' \
        -DENABLE_EXAMPLES:BOOL='OFF' \
        -DENABLE_TESTS:BOOL='OFF' \
        -DENABLE_AVX:BOOL='OFF' \
        -DENABLE_AVX2:BOOL='OFF' \
        -DENABLE_MMX:BOOL='ON' \
        -DENABLE_SSE:BOOL='ON' \
        -DENABLE_SSE2:BOOL='ON' \
        -DENABLE_SSE3:BOOL='OFF' \
        -DENABLE_SSSE3:BOOL='OFF' \
        -DENABLE_SSE4_1:BOOL='OFF' \
        -DENABLE_SSE4_2:BOOL='OFF' \
        -Wno-dev
    cmake --build build
}

# NOTE: uncomment for tests (takes an extraordinary long time to run)
#check() {
#    export LIBAOM_TEST_DATA_PATH="${srcdir}/testdata"
#    cmake --build build --target testdata runtests
#}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 avm/{LICENSE,PATENTS} -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
