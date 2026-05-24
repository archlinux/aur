# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=avm
pkgver=15.0.0
pkgrel=2
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
source=("git+https://gitlab.com/AOMediaCodec/avm.git#tag=research-v${pkgver}")
sha256sums=('5c1ce0553fd0e94d7f262d048a13587b504c6d30588d9b92d135d1fb51c08fa1')

build() {
    # NOTE: set ENABLE_TESTS to ON for tests
    # NOTE: disabled DIP_EXT_PRUNING and ML_PART_SPLIT to avoid dependency on libtensorflow-lite (heavy)
    cmake -B build -S avm \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCONFIG_DIP_EXT_PRUNING:STRING='0' \
        -DCONFIG_ML_PART_SPLIT:STRING='0' \
        -DCONFIG_TENSORFLOW_LITE:STRING='0' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DENABLE_DOCS:BOOL='OFF' \
        -DENABLE_EXAMPLES:BOOL='OFF' \
        -DENABLE_TESTS:BOOL='OFF' \
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
