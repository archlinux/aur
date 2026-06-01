# Maintainer: Smoolak <smoolak [at] gmail.com>

pkgname=python-tensorrt-llm
_pkgname=TensorRT-LLM
pkgver=1.2.1
pkgrel=1
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
    'nanobind'
    'python-pybind11-stubgen'
)
optdepends=(
    'python-evaluate: for evaluation metrics'
    'python-blobfile: for blob file operations'
    'triton-inference-server: for Triton deployment'
)
source=("${_pkgname}-${pkgver}::git+https://github.com/NVIDIA/${_pkgname}.git#tag=v${pkgver}"
        "glog-0.7-compatibility.patch")
sha256sums=('SKIP'
            '8227c455479f0013ebf65b2fd7541e19e66b323cdb6e2a65d5f4486622484e0e')

prepare() {
    cd "${_pkgname}-${pkgver}"

    # internal_cutlass_kernels (and other large blobs) ship precompiled via Git
    # LFS; the makepkg git mirror contains only LFS pointer stubs, so cmake fails
    # with "internal_cutlass_kernels library is truncated or incomplete". Pull the
    # real LFS objects from GitHub (makepkg's local mirror has no LFS objects).
    git lfs install --local
    git remote add lfs-origin https://github.com/NVIDIA/${_pkgname}.git 2>/dev/null || true
    git lfs pull lfs-origin

    # Apply glog 0.7.0+ compatibility patch
    patch -Np1 -i "${srcdir}/glog-0.7-compatibility.patch"

    # Patch build_wheel.py to skip pip install (dependencies handled by pacman/AUR)
    # Replace the pip install line for requirements
    sed -i '/build_run.*pip install -r.*requirements_file/c\    if os.environ.get("SKIP_PIP_INSTALL") != "1":\n        build_run(f'"'"'"{venv_python}" -m pip install -r "{requirements_file}"'"'"')\n    else:\n        print(f"-- Skipping pip install - using system packages...")' scripts/build_wheel.py

    # Replace the pip install line for conan
    sed -i '/build_run.*pip install conan/c\    if os.environ.get("SKIP_PIP_INSTALL") != "1":\n        build_run(f'"'"'"{venv_python}" -m pip install conan==2.14.0'"'"')\n    else:\n        print(f"-- Skipping conan pip install - using system conan...")' scripts/build_wheel.py

    # build_wheel.py assumes a pip-based env. On Arch, TensorRT and the stub
    # generators come from pacman, not pip:
    #  - it verifies TensorRT with `pip show tensorrt` (fails: tensorrt is pacman)
    #    -> verify via `import tensorrt` instead (actually exercises the install).
    #  - it pip-installs nanobind / pybind11-stubgen mid-build for stub generation
    #    -> those are makedepends (nanobind, python-pybind11-stubgen); drop the pip calls.
    python3 - <<'PYEOF'
import re
f = "scripts/build_wheel.py"
s = open(f).read()
s = s.replace('"-m", "pip", "show", "tensorrt"', '"-c", "import tensorrt"')
s = re.sub(r'build_run\(f?"[^\n]*pip install nanobind[^\n]*\)', 'pass  # nanobind provided by pacman', s)
s = re.sub(r'build_run\(f?"[^\n]*pip install pybind11-stubgen[^\n]*\)', 'pass  # pybind11-stubgen provided by pacman', s)
open(f, "w").write(s)
print("patched build_wheel.py: tensorrt import-check + dropped stub-gen pip installs")
PYEOF

    # cutlass_kernels/CMakeLists.txt runs two configure-time execute_process steps:
    #  (1) `setup_library.py develop --user` -> a setuptools/--user install (pip-ish,
    #      PEP668) that just makes cutlass_library importable; and
    #  (2) `generate_kernels.py -a <archs>` (`from cutlass_library import *`) which
    #      emits the kernel instantiations the *_gemm_src/cutlass_src static libs
    #      compile. If (2) can't import cutlass_library, generate_kernels fails and
    #      cmake aborts (FATAL_ERROR). We neutralise (1) to a no-op (exit 0, no
    #      install) and point (2) at the version-matched cutlass_library shipped as
    #      pure Python in the FetchContent'd CUTLASS source tree via PYTHONPATH.
    # (Done as exact string replacements, NOT a sed line-range: a `/exec/,/RESULT/`
    # range runs away past the 2nd execute_process to EOF — silently commenting out
    # every add_library(*_gemm_src) so the final link fails on "cannot find -l...".)
    python3 - <<'PYEOF'
f = "cpp/tensorrt_llm/kernels/cutlass_kernels/CMakeLists.txt"
s = open(f).read()
before = s
s = s.replace('${Python3_EXECUTABLE} setup_library.py develop --user',
              '${Python3_EXECUTABLE} --version')
assert s != before, "setup_library COMMAND not found (upstream changed)"
before = s
s = s.replace('COMMAND ${Python3_EXECUTABLE} generate_kernels.py',
              'COMMAND ${CMAKE_COMMAND} -E env PYTHONPATH=${cutlass_source_dir}/python ${Python3_EXECUTABLE} generate_kernels.py')
assert s != before, "generate_kernels COMMAND not found (upstream changed)"
# low_latency_gemm_src is the only target that adds ${cutlass_source_dir}/examples to
# its includes, pulling the CUTLASS Hopper weight-prefetch header (examples/63) which
# uses C++20 non-type class-type template params. The project global standard is C++17
# (cpp/CMakeLists.txt) and every other OSS cutlass target builds fine at 17, so bump
# only this one to C++20 (TARGET-guarded so it no-ops if upstream drops the target).
s += ('\nif(TARGET low_latency_gemm_src)\n'
      '  set_target_properties(low_latency_gemm_src PROPERTIES\n'
      '    CUDA_STANDARD 20 CUDA_STANDARD_REQUIRED ON\n'
      '    CXX_STANDARD 20 CXX_STANDARD_REQUIRED ON)\n'
      'endif()\n')
open(f, "w").write(s)
print("patched cutlass_kernels/CMakeLists.txt: no-op setup_library + PYTHONPATH for generate_kernels + C++20 for low_latency_gemm_src")
PYEOF

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

    # find_package(Torch) otherwise picks up a stale Caffe2/Torch cmake config
    # under /opt/cuda that points c10_cuda at a non-existent /opt/cuda/lib/libc10_cuda.so.
    # Point cmake at torch's own (correct) cmake dir so the imported targets resolve.
    local _torch_cmake
    _torch_cmake="$(python -c 'import torch; print(torch.utils.cmake_prefix_path)')"
    export Torch_DIR="${_torch_cmake}/Torch"
    export CMAKE_PREFIX_PATH="${_torch_cmake}${CMAKE_PREFIX_PATH:+:${CMAKE_PREFIX_PATH}}"

    # Build the C++ libraries first using the build_wheel.py script
    # This will use CMake and Conan to build the C++ components
    # Use --no-venv to avoid PEP 668 issues with system Python
    # Set SKIP_PIP_INSTALL=1 to skip pip install (dependencies handled by pacman)
    export SKIP_PIP_INSTALL=1
    # KDIAG: are the *_gemm_src kernel sources actually present in the checkout?
    # (link failed on -lfp4_gemm_src/-lmoe_gemm_src/... — find out if it's missing
    # sources vs a cmake issue). Prints early, before the long compile.
    echo "=== KDIAG kernel source dirs (cwd=$PWD) ==="
    for _kd in fp4_gemm moe_gemm low_latency_gemm allreduce_gemm fp8_blockscale_gemm fpA_intB_gemm fp8_rowwise_gemm; do
      echo "KDIAG $_kd: $(find cpp/tensorrt_llm/kernels/cutlass_kernels/$_kd -name '*.cu' 2>/dev/null | wc -l) .cu, $(find cpp/tensorrt_llm/kernels/cutlass_kernels/$_kd -name '*.cu' -exec cat {} + 2>/dev/null | wc -c) bytes"
    done
    # build_wheel.py defaults cuda_architectures to "all"; generate_kernels.py then
    # does "all".split(';') -> ["all"], an invalid arch, so it emits ZERO kernel
    # instantiations and the OSS cutlass *_gemm_src libs build nothing -> link fails
    # on -lcutlass_src/-lfp4_gemm_src/... Pass an explicit, parseable arch list
    # (full Ampere->Blackwell coverage) so the instantiations actually generate.
    python scripts/build_wheel.py --clean --build_type=Release --no-venv --job_count 56 \
        --cuda_architectures "80-real;86-real;89-real;90-real;100-real;103-real;120-real" || _bw=$?
    echo "=== POSTDIAG: gemm_src/cutlass .a produced (size path) ==="
    find "$srcdir" \( -name 'lib*gemm_src*.a' -o -name 'libfp8_blockscale*.a' -o -name 'libcutlass_src*.a' \) 2>/dev/null | xargs -r ls -la
    echo "=== POSTDIAG: all .a under any cutlass_kernels build dir ==="
    find "$srcdir" -path '*cutlass_kernels*' -name '*.a' 2>/dev/null | xargs -r ls -la | tail -25
    echo "=== POSTDIAG: did fp4/moe/etc objects compile? ==="
    find "$srcdir" -path '*cutlass_kernels*' -name '*.o' 2>/dev/null | grep -oE '(fp4_gemm|moe_gemm|low_latency_gemm|allreduce_gemm|fp8_blockscale_gemm)' | sort | uniq -c
    [ -n "${_bw:-}" ] && exit "$_bw" || true
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

    # build_wheel.py writes the wheel into build/ (not dist/), so locate it
    # wherever it landed under the source tree instead of assuming a path.
    local _whl
    _whl=$(find "$PWD" -name 'tensorrt_llm-*.whl' -print -quit)
    [ -n "$_whl" ] || { echo "ERROR: tensorrt_llm wheel not found under $PWD" >&2; exit 1; }
    python -m installer --destdir="$pkgdir" "$_whl"

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
