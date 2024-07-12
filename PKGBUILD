# Maintainer: Zhirui Dai <daizhirui at hotmail dot com>

pkgbase=pytorch-kineto-git
pkgname=(libkineto-git torch-tb-profiler-git)
pkgver=r569.eb34f14
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
    "fmt.patch"
)
sha256sums=(
    SKIP
    c153064b7aa098328e4bbc0e3dd996119dacc9152b082d98c54a5e8a03d2bf4e
)

pkgver() {
    cd ${srcdir}/kineto
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/kineto"
    git submodule update --init --recursive
    patch -Np1 -i ${srcdir}/fmt.patch
    cd "${srcdir}/kineto/libkineto"
    mkdir -p build
}

build() {
    cd "${srcdir}/kineto/libkineto/build"
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DKINETO_BUILD_TESTS=OFF
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
