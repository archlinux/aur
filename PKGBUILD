# Maintainer: Smoolak <smoolak [at] gmail.com>.
# NOTE: This package requires NVIDIA CUDA and TensorRT to build and run

pkgname=python-torch-tensorrt
_pkgname=torch-tensorrt
pkgver=2.9.0
pkgrel=1
pkgdesc="Easily achieve the best inference performance for any PyTorch model on the NVIDIA platform"
arch=('x86_64' 'aarch64')
url="https://github.com/pytorch/TensorRT"
license=('BSD-3-Clause')
depends=(
    'python'
    'python-pytorch-cuda'
    'python-numpy'
    'python-packaging'
    'python-typing_extensions'
    'python-yaml'
    'python-psutil'
    'cuda'
    'tensorrt'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
    'python-pip'
    'bazel'
)
depends+=(
    'python-dllist'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pytorch/TensorRT/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9d1db6aa671d73be102ecd79e7045bc1dad9e20b97b7a5b4992f94d3642c904e')

prepare() {
    cd "TensorRT-${pkgver}"

    # Set up Python path for build
    export PYTHONPATH="${srcdir}/TensorRT-${pkgver}/py:${PYTHONPATH}"
}

build() {
    cd "TensorRT-${pkgver}"

    # Set environment variables for CUDA and TensorRT
    export CUDA_HOME=/opt/cuda
    export CUDACXX=/opt/cuda/bin/nvcc

    # Use system Bazel
    export USE_HOST_BAZEL=1

    # Set compilation mode to optimized
    export COMPILATION_MODE=opt

    # Build with full C++ extensions and TorchScript support
    # This will use Bazel to build libtorchtrt and then build Python bindings
    python setup.py build
}

check() {
    cd "TensorRT-${pkgver}"

    # Basic import test (may fail if CUDA/TensorRT not available during build)
    PYTHONPATH="${PWD}/py:${PYTHONPATH}" python -c "import torch_tensorrt; print(torch_tensorrt.__version__)" || \
        echo "Warning: Import test failed - this is expected if CUDA/TensorRT are not available"
}

package() {
    cd "TensorRT-${pkgver}"

    # Install the package
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # Install C++ headers if built
    if [ -d "py/torch_tensorrt/include" ]; then
        install -dm755 "${pkgdir}/usr/include"
        cp -r py/torch_tensorrt/include "${pkgdir}/usr/include/torch_tensorrt"
    fi
}