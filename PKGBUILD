# Maintainer: Zhirui Dai <daizhirui at hotmail dot com>

pkgbase=pytorch-kineto-git
pkgname=(libkineto-git torch-tb-profiler-git)
pkgver=r498.8466a8b
pkgrel=1
pkgdesc="Kineto is part of the PyTorch Profiler"
arch=('x86_64')
url="http://www.pytorch.org"
license=('BSD')
depends=(
    python-pytorch
)
optdepends=(
)
makedepends=(
    cmake
    git
    python-setuptools
)
source=(
    "kineto::git+https://github.com/pytorch/kineto.git"
)
sha256sums=(
    SKIP
)

pkgver() {
    cd ${srcdir}/kineto
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/kineto"
    git submodule update --init --recursive
    cd "${srcdir}/kineto/libkineto"
    mkdir -p build
}

build() {
    cd "${srcdir}/kineto/libkineto/build"
    cmake ..
    make -j$(nproc)
}

function package_libkineto-git() {
    depends=(
        python-pytorch
    )
    optdepends=()
    conflicts=()
    cd ${srcdir}/kineto/libkineto/build
    make DESTDIR=${pkgdir} install
}

function package_torch-tb-profiler-git() {
    depends=(
        python-pytorch
    )
    optdepends=()
    conflicts=()
    cd ${srcdir}/kineto/tb_plugin
    python setup.py install --root="${pkgdir}/"
}
