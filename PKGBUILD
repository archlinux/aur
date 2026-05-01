# Maintainer: Zhirui Dai <daizhirui at hotmail dot com>

pkgbase=pytorch-kineto-git
pkgname=(libkineto-git)
pkgver=r924.63cc35ed
pkgrel=1
pkgdesc="Kineto is part of the PyTorch Profiler"
arch=('x86_64')
url="http://www.pytorch.org"
license=('BSD')
depends=(fmt)
optdepends=()
makedepends=(
    cmake
    git
    python-setuptools
)
source=(
    "kineto::git+https://github.com/pytorch/kineto.git"
    #"3rdparty.patch"
    #"mkstemps.patch"
)
sha256sums=('SKIP'
            #'dbedadc2b00acd0611456d704e8cbdab5d24d724b5faa01243d47487f31658aa'
            #'3dead63b8d53b326c5614c6af5d688b5581c7913e3d79d13f7df5807912912ad'
            )

pkgver() {
    cd ${srcdir}/kineto
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/kineto"
    git submodule update --init --recursive
    # patch -Np1 -i ${srcdir}/3rdparty.patch
    # patch -Np1 -i ${srcdir}/mkstemps.patch
    cd "${srcdir}/kineto/libkineto"
    mkdir -p build
}

build() {
    cd "${srcdir}/kineto/libkineto/build"
    cmake .. \
        -DCUDA_SOURCE_DIR=/opt/cuda \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DKINETO_BUILD_TESTS=ON
    make -j$(nproc)
}

function package_libkineto-git() {
    depends=()
    optdepends=()
    conflicts=()
    cd ${srcdir}/kineto/libkineto/build
    make DESTDIR=${pkgdir} install
}
