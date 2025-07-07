# Maintainer: Zhirui Dai <daizhirui at hotmail dot com>

pkgbase=pytorch-kineto-git
pkgname=(libkineto-git torch-tb-profiler-git)
pkgver=r704.16e2a56b
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
    bb4e761d167a07071e6ef70279a65ea61de27e9d6f38f80bfdbf8b313ebdc49c
)

pkgver() {
    cd ${srcdir}/kineto
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/kineto"
    git submodule update --init --recursive
    patch -Np1 -i ${srcdir}/3rdparty.patch
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
