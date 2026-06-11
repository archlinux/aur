#  Maintainer: crl <crl18039102576@126.com>

pkgbase=python-torchrl
pkgname=(python-torchrl python-torchrl-cuda)
pkgver=0.13.1
pkgrel=1
pkgdesc="A modular, primitive-first, python-first PyTorch library for Reinforcement Learning."
url="https://github.com/pytorch/rl"
arch=(x86_64)
license=('MIT')
depends=(python python-cloudpickle python-tensordict python-numpy python-packaging)
makedepends=(python-build python-wheel python-installer python-setuptools gcc cuda python-pytorch ninja)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz" "setup.patch" "cuda-flags.patch")
sha256sums=(
    '6b52114ac84bdae89a0e10c9e48a259de14b27a2efde93341847ded00fbaa3bf'
    '3916428ad174568ea43162a133ac5588f135a6a242cfcd6e8e2c0eca7bfb80c3'
    '21c2864cb9a7de0faaa600bf266ab05c1e6bd3d3e879c2ac5697f74e0732e0f5'
)

prepare() {
    cd "${srcdir}"
    rm -rf "rl-cuda-$pkgver"
    cp -a "rl-$pkgver" "rl-cuda-$pkgver"
    cd "${srcdir}/rl-$pkgver"
    patch -p0 -i "${srcdir}/setup.patch"
    cd "${srcdir}/rl-cuda-$pkgver"
    patch -p0 -i "${srcdir}/cuda-flags.patch"
}

build() {
    export TORCHRL_BUILD_VERSION="$pkgver"

    cd "${srcdir}/rl-$pkgver"
    export CXXFLAGS="$CXXFLAGS -DGLOG_USE_GLOG_EXPORT"
    export CFLAGS="$CFLAGS -DGLOG_USE_GLOG_EXPORT"
    unset CUDA_HOME
    python -m build --wheel --no-isolation --skip-dependency-check

    cd "${srcdir}/rl-cuda-$pkgver"
    export CXXFLAGS="$CXXFLAGS -DGLOG_USE_GLOG_EXPORT"
    export CFLAGS="$CFLAGS -DGLOG_USE_GLOG_EXPORT"
    export CUDAFLAGS="$CUDAFLAGS -DGLOG_USE_GLOG_EXPORT"
    export CUDA_HOME="/opt/cuda"
    export FORCE_CUDA=1
    python -m build --wheel --no-isolation --skip-dependency-check
}

package_python-torchrl() {
    depends+=("python-pytorch")

    cd rl-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


package_python-torchrl-cuda() {
    depends+=("python-pytorch-cuda" "cuda")
    conflicts=("python-torchrl")
    provides=("python-torchrl")
    cd rl-cuda-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
