# Maintainer: Zhirui Dai <daizhirui at hotmail dot com>

pkgbase=pytorch-kineto-git
pkgname=(libkineto-git torch-tb-profiler-git)
pkgver=r708.186618f2
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
    "3rdparty.patch"
)
sha256sums=(
    SKIP
    dbedadc2b00acd0611456d704e8cbdab5d24d724b5faa01243d47487f31658aa
)

pkgver() {
    cd ${srcdir}/kineto
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/kineto"
    git submodule update --init --recursive
    # patch -Np1 -i ${srcdir}/3rdparty.patch
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

function package_torch-tb-profiler-git() {
    depends=()
    optdepends=()
    conflicts=()
    cd ${srcdir}/kineto/tb_plugin
    python setup.py install --root="${pkgdir}/"
}
