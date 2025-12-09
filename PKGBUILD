# Maintainer: Smoolak <smoolak [at] gmail.com>

pkgname=python-tensorrt-llm
_pkgname=TensorRT-LLM
pkgver=1.2.0rc4
pkgrel=3
pkgdesc="TensorRT LLM provides users with an easy-to-use Python API to define Large Language Models (LLMs) and supports state-of-the-art optimizations to perform inference efficiently on NVIDIA GPUs"
arch=('x86_64')
url="https://github.com/NVIDIA/TensorRT-LLM"
license=('Apache-2.0')
depends=(
    'python'
    'python-pytorch-cuda'
    'python-numpy'
    'python-transformers'
    'python-tensorrt'
    'python-nvidia-modelopt'
    'python-accelerate'
    'python-diffusers'
    'python-onnx'
    'python-pillow'
    'python-sentencepiece'
    'python-psutil'
    'python-pydantic'
    'python-fastapi'
    'uvicorn'
    'python-click'
    'python-mpi4py'
    'python-pandas'
    'python-h5py'
    'python-openai'
    'python-pyzmq'
    'python-peft'
    'python-einops'
    'python-opencv'
    'python-soundfile'
    'python-tiktoken'
    'python-colored'
    'python-lark-parser'
    'python-pulp'
    'python-prometheus_client'
    'python-omegaconf'
    'python-wheel'
    'python-nvidia-ml-py'
    'python-torchvision'
    'python-optimum'
    'python-datasets'
    'python-mpmath'
    'python-starlette'
    'python-ordered-set'
    'python-pypatchelf'
    'python-jsonschema'
    'python-backoff'
    'python-matplotlib'
    'python-plotly'
    'python-numexpr'
    'python-triton'
    'python-nvtx'
    'cuda'
    'cudnn'
    'tensorrt'
    'nccl'
    'rdma-core'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'cmake>=3.27'
    'conan'
    'ninja'
    'meson'
    'gcc'
    'git'
    'python-cutlass'
)
optdepends=(
    'python-evaluate: for evaluation metrics'
    'python-blobfile: for blob file operations'
    'triton-inference-server: for Triton deployment'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/NVIDIA/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        "glog-0.7-compatibility.patch")
sha256sums=('295dffddbd57f6a6b815969e42d171bd42140c3f2b15f68323fc4cac3e97d39a'
            '8227c455479f0013ebf65b2fd7541e19e66b323cdb6e2a65d5f4486622484e0e')

prepare() {
    cd "${_pkgname}-${pkgver}"

    # Apply glog 0.7.0+ compatibility patch
    patch -Np1 -i "${srcdir}/glog-0.7-compatibility.patch"

    # Patch build_wheel.py to skip pip install (dependencies handled by pacman/AUR)
    # Replace the pip install line for requirements
    sed -i '/build_run.*pip install -r.*requirements_file/c\    if os.environ.get("SKIP_PIP_INSTALL") != "1":\n        build_run(f'"'"'"{venv_python}" -m pip install -r "{requirements_file}"'"'"')\n    else:\n        print(f"-- Skipping pip install - using system packages...")' scripts/build_wheel.py

    # Replace the pip install line for conan
    sed -i '/build_run.*pip install conan/c\    if os.environ.get("SKIP_PIP_INSTALL") != "1":\n        build_run(f'"'"'"{venv_python}" -m pip install conan==2.14.0'"'"')\n    else:\n        print(f"-- Skipping conan pip install - using system conan...")' scripts/build_wheel.py

    # Patch CMakeLists.txt to skip CUTLASS library setup (which tries to pip install)
    # Comment out the execute_process that calls setup_library.py develop --user
    sed -i '/execute_process(/,/RESULT_VARIABLE _CUTLASS_LIBRARY_SUCCESS)/s/^/#/' cpp/tensorrt_llm/kernels/cutlass_kernels/CMakeLists.txt
    # Set the success variable to 0 to skip the error check
    sed -i '/if(NOT _CUTLASS_LIBRARY_SUCCESS EQUAL 0)/i set(_CUTLASS_LIBRARY_SUCCESS 0)' cpp/tensorrt_llm/kernels/cutlass_kernels/CMakeLists.txt

    # Set CUDA_HOME for the build
    export CUDA_HOME=/opt/cuda
    export CUDACXX=/opt/cuda/bin/nvcc
    export PATH="/opt/cuda/bin:${PATH}"
}

build() {
    cd "${_pkgname}-${pkgver}"

    # Set environment variables for CUDA and TensorRT
    export CUDA_HOME=/opt/cuda
    export CUDACXX=/opt/cuda/bin/nvcc
    export TENSORRT_DIR=/usr
    export LD_LIBRARY_PATH=/usr/lib:${LD_LIBRARY_PATH}
    export PATH="/opt/cuda/bin:${PATH}"

    # Build the C++ libraries first using the build_wheel.py script
    # This will use CMake and Conan to build the C++ components
    # Use --no-venv to avoid PEP 668 issues with system Python
    # Set SKIP_PIP_INSTALL=1 to skip pip install (dependencies handled by pacman)
    export SKIP_PIP_INSTALL=1
    python scripts/build_wheel.py --clean --build_type=Release --no-venv
}

check() {
    cd "${_pkgname}-${pkgver}"

    # Basic import test (may fail if CUDA/TensorRT not available during build)
    PYTHONPATH="${PWD}:${PYTHONPATH}" \
        python -c "import tensorrt_llm; print(tensorrt_llm.__version__)" || \
        echo "Warning: Import test failed - this is expected if CUDA/TensorRT are not available"
}

package() {
    cd "${_pkgname}-${pkgver}"

    # Install the package using modern installer
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install licenses
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install attribution files (x86_64 only)
    if [ -f "ATTRIBUTIONS-CPP-x86_64.md" ]; then
        install -Dm644 "ATTRIBUTIONS-CPP-x86_64.md" "${pkgdir}/usr/share/licenses/${pkgname}/ATTRIBUTIONS-CPP-x86_64.md"
    fi
    if [ -f "ATTRIBUTIONS-Python.md" ]; then
        install -Dm644 "ATTRIBUTIONS-Python.md" "${pkgdir}/usr/share/licenses/${pkgname}/ATTRIBUTIONS-Python.md"
    fi

    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
