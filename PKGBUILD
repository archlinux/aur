# Maintainer: Smoolak <smoolak [at] gmail.com>

pkgname=python-torch-tensorrt
_pkgname=torch-tensorrt
pkgver=2.9.0
pkgrel=5
pkgdesc="Easily achieve the best inference performance for any PyTorch model on the NVIDIA platform"
arch=('x86_64')
url="https://github.com/pytorch/TensorRT"
license=('BSD-3-Clause')
depends=(
    'python'
    'python-pytorch-cuda'
    'python-numpy'
    'python-packaging'
    'python-typing_extensions'
    'python-dllist'
    'python-tensorrt'
    'python-rich'
    'python-nvidia-modelopt'
    'python-torchvision'
    'cuda'
    'tensorrt'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
    'pybind11'
    'python-ninja'
)
optdepends=(
    'python-pydot: for engine visualization features'
    'python-graphviz: for graph utilities'
    'tensorrt-llm: for LLM inference support'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pytorch/TensorRT/archive/refs/tags/v${pkgver}.tar.gz"
        "fix-glog-0.7.patch")
source_x86_64=("bazel-8.1.1::https://github.com/bazelbuild/bazel/releases/download/8.1.1/bazel-8.1.1-linux-x86_64")
sha256sums=('9d1db6aa671d73be102ecd79e7045bc1dad9e20b97b7a5b4992f94d3642c904e'
            '4a7413873885f73d7e3fa142308953225a6b3af4d0969707e75bfcadf046e9b8')
sha256sums_x86_64=('a2a095d7006ea70bdfdbe90a71f99f957fee1212d4614cfcfdbe3aadae681def')

prepare() {
    cd "TensorRT-${pkgver}"

    # Apply patch for glog 0.7.x compatibility
    patch -p1 < "${srcdir}/fix-glog-0.7.patch"

    # Fix pybind11 version requirement to work with system pybind11
    sed -i 's/pybind11==2.6.2/pybind11>=2.6.2/' pyproject.toml

    # Make downloaded Bazel executable
    chmod +x "${srcdir}/bazel-8.1.1"

    # Create a bazel symlink that setup.py can find
    ln -sf "${srcdir}/bazel-8.1.1" "${srcdir}/bazel"

    # TensorRT lib architecture path for x86_64
    _trt_arch="x86_64-linux-gnu"

    # Create a local directory structure that matches what Bazel's third_party/tensorrt/local/BUILD expects
    mkdir -p "tensorrt_local/lib/${_trt_arch}"
    mkdir -p "tensorrt_local/include/${_trt_arch}"

    # Link system TensorRT libraries
    ln -sf /usr/lib/libnvinfer*.so* "tensorrt_local/lib/${_trt_arch}/"
    ln -sf /usr/lib/libnvparsers.so* "tensorrt_local/lib/${_trt_arch}/"
    ln -sf /usr/lib/libnvonnxparser*.so* "tensorrt_local/lib/${_trt_arch}/"
    ln -sf /usr/lib/libnvinfer_plugin*.so* "tensorrt_local/lib/${_trt_arch}/"

    # Link system TensorRT headers
    ln -sf /usr/include/NvInfer*.h "tensorrt_local/include/${_trt_arch}/"
    ln -sf /usr/include/NvOnnx*.h "tensorrt_local/include/${_trt_arch}/"
    ln -sf /usr/include/NvCaffeParser.h "tensorrt_local/include/${_trt_arch}/" 2>/dev/null || true
    ln -sf /usr/include/NvUffParser.h "tensorrt_local/include/${_trt_arch}/" 2>/dev/null || true

    # Modify MODULE.bazel to use local TensorRT instead of downloading
    # Comment out the http_archive for tensorrt (lines 101-108)
    sed -i '101,108s/^/#/' MODULE.bazel

    # Uncomment the new_local_repository for tensorrt (lines 167-171) and set correct path
    sed -i '167,171s/^#//' MODULE.bazel
    sed -i 's|path = "/usr/"|path = "'"${srcdir}/TensorRT-${pkgver}/tensorrt_local"'"|' MODULE.bazel

    # Also update CUDA path in MODULE.bazel to use /opt/cuda
    sed -i 's|path = "/usr/local/cuda-13.0/"|path = "/opt/cuda/"|' MODULE.bazel

    # Patch setup.py to use system TensorRT instead of querying Bazel
    # This replaces the Bazel query lambdas with simple lambdas that return "/usr"
    sed -i '/tensorrt_x86_64_external_dir = (/,/^    )$/c\    tensorrt_x86_64_external_dir = lambda: "/usr"' setup.py
    sed -i '/tensorrt_rtx_external_dir = (/,/^    )$/c\    tensorrt_rtx_external_dir = lambda: "/usr"' setup.py
    sed -i '/tensorrt_sbsa_external_dir = (/,/^    )$/c\    tensorrt_sbsa_external_dir = lambda: "/usr"' setup.py
    sed -i '/tensorrt_jetpack_external_dir = (/,/^    )$/c\    tensorrt_jetpack_external_dir = lambda: "/usr"' setup.py
}

build() {
    cd "TensorRT-${pkgver}"

    # Set environment variables for CUDA and TensorRT
    export CUDA_HOME=/opt/cuda
    export CUDACXX=/opt/cuda/bin/nvcc
    export TENSORRT_DIR=/usr
    export LD_LIBRARY_PATH=/usr/lib:${LD_LIBRARY_PATH}

    # Use the specific Bazel version we downloaded
    export PATH="${srcdir}:${PATH}"
    export BAZEL_EXE="${srcdir}/bazel-8.1.1"
    export USE_HOST_BAZEL=1

    # Set compilation mode to optimized
    export COMPILATION_MODE=opt

    # Fix glog compilation issue - ensure GLOG_USE_GLOG_EXPORT is defined
    export CXXFLAGS="${CXXFLAGS} -DGLOG_USE_GLOG_EXPORT"

    # First, build the C++ library with Bazel
    "${srcdir}/bazel-8.1.1" build //:libtorchtrt --compilation_mode=opt

    # Extract libraries from the tarball built by Bazel
    tar -xzf bazel-bin/libtorchtrt.tar.gz

    # Copy the built libraries to the location expected by setup.py
    mkdir -p py/torch_tensorrt/lib
    cp -v torch_tensorrt/lib/*.so py/torch_tensorrt/lib/

    # Build Python wheel using modern build system
    python -m build --wheel --no-isolation
}

check() {
    cd "TensorRT-${pkgver}"

    # Basic import test (may fail if CUDA/TensorRT not available during build)
    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-cpython-313:${PYTHONPATH}" \
        python -c "import torch_tensorrt; print(torch_tensorrt.__version__)" || \
        echo "Warning: Import test failed - this is expected if CUDA/TensorRT are not available"
}

package() {
    cd "TensorRT-${pkgver}"

    # Install the package using modern installer
    python -m installer --destdir="$pkgdir" dist/*.whl

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
