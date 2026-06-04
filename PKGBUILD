# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=avm
pkgver=1.0.0
pkgrel=1
epoch=1
pkgdesc='AOM Video Model - the reference software for AV2 codec from Alliance for Open Media'
arch=('x86_64')
url='https://github.com/AOMediaCodec/avm/'
license=('BSD-3-Clause-Clear')
depends=(
    'glibc'
    'libgcc'
    'libstdc++')
makedepends=(
    'cmake'
    'git'
    'perl'
    #'python' # for tests
    'yasm')
source=("git+https://github.com/AOMediaCodec/avm.git#tag=v${pkgver}")
sha256sums=('41ea97e28d03b5d3f0e236d9d240458deb265711ef61466484b4926506b935c1')

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
        -DENABLE_EXAMPLES:BOOL='ON' \
        -DENABLE_TESTS:BOOL='OFF' \
        -Wno-dev
    cmake --build build
}

# NOTE: uncomment for tests (takes an extraordinary long time to run)
#check() {
#    export LIBAVM_TEST_DATA_PATH="${srcdir}/testdata"
#    cmake --build build --target testdata runtests
#}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 avm/{LICENSE,PATENTS} -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
