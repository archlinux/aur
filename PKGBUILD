# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgbase=cutlass
pkgname=('cutlass' 'python-cutlass')
pkgver=4.7.1
pkgrel=1
pkgdesc='CUDA Templates for Linear Algebra Subroutines'
arch=('x86_64')
url='https://github.com/NVIDIA/cutlass'
license=('BSD-3-Clause')
depends=('cuda' 'cudnn')
makedepends=('cmake' 'git' 'ninja' 'patchelf' 'pybind11' 'python-build' 'python-cuda'
             'python-installer' 'python-ml-dtypes' 'python-networkx'
             'python-numpy' 'python-pydot' 'python-scikit-build'
             'python-setuptools' 'python-treelib' 'python-wheel')
checkdepends=('python-pytest')
source=(
    "$pkgbase-$pkgver.tar.gz::https://github.com/NVIDIA/$pkgbase/archive/refs/tags/v$pkgver.tar.gz"
    'cuda-python-13.patch'
    'cuda13-family-arch-aliases.patch'
    'sm100f-sparse-mxf4-target.patch'
    'per-target-architecture-bounds.patch'
    'sm120f-sparse-mxf4-target.patch'
    'sm100-cross-fp8-link-split.patch'
    'sm120-epilogue-tile-filter.patch'
    'sm120-fp6-small-n-copy-atom.patch'
    'system-cuda-rpath.patch'
    'complete-cutlass-cppgen-packages.patch'
    'system-cutlass-path.patch'
    'use-ml-dtypes-for-bfloat16.patch'
)
sha256sums=(
    '8290eb914cd5aaf4c665ee4108ba5bd65383cfee1296286a42a7ef711554d365'
    '0da3200384a74d9474fcf44dbf80f269af4df4216c00c736cb48b48d32ccfcd0'
    'd63a509e9d7947142c583ca4ea918a12da22e4e05040e78cb01db3beb49f5cf9'
    '5fe8a416b8ac2151d1ff46fbf7478a8990500636cb99ced4c7d16b8e71d4e5e6'
    'e853ba878f201106275f83fe2bef877996080d0461276c60912c1af7448610cc'
    '7942d994481d48d297c7bf8cd8f6e276c3ed83f8a0e0ddc8aa02d1e31decfd5a'
    '743873d31acf54f9049d55109af6f4fa615163ca79e49481f204a09682df877d'
    'fe0188fd07fb1529d199c26013ec33bafd64e8d6a08dea39593efb5d18fcc221'
    '922524812df1b5fd83c24215894e4dacf79c54d9085e2f28a8c598c8ea605cc2'
    '3f954656b205a02f9858b6fff841bfc6d984efcec708d8b53d0acf1520c5473a'
    '69e908e126e1a2b5950e4d9fa4785e9708758ac2d3ad9ff569d1e40ae92b5e0c'
    '2541e1254c30630657c63d61c520f257a491f02409c526940887c9e9d5c042af'
    '2dfc650e186dad707250601eed175b235e1f9472e0cc1ed9f68172ab582dbd5c'
)

prepare() {
    cd "$pkgbase-$pkgver"
    # Google's abandoned bfloat16 extension does not support NumPy 2. Use the
    # maintained, API-compatible scalar type shipped by ml-dtypes.
    patch -Np1 -i "$srcdir/cuda-python-13.patch"
    patch -Np1 -i "$srcdir/cuda13-family-arch-aliases.patch"
    patch -Np1 -i "$srcdir/sm100f-sparse-mxf4-target.patch"
    patch -Np1 -i "$srcdir/per-target-architecture-bounds.patch"
    # PTX excludes SM120 sparse MXF4/NVF4 from family-specific targets; retain
    # both concrete 120/121 architectures that support the instruction class.
    patch -Np1 -i "$srcdir/sm120f-sparse-mxf4-target.patch"
    # Two crossed-FP8 SM100 grouped targets exceed the x86-64 PC-relative
    # range when six code profiles are linked into one DSO. Partition only
    # their private build targets by output type, preserving every kernel.
    patch -Np1 -i "$srcdir/sm100-cross-fp8-link-split.patch"
    # CUTLASS 4.6.1 generates SM120 small-N output epilogues that violate its
    # own storage-atom and scale-vector contracts. Keep every valid small-N
    # kernel while rejecting only those impossible template combinations.
    patch -Np1 -i "$srcdir/sm120-epilogue-tile-filter.patch"
    # CUTLASS selects the four-register FP6 shared-memory copy atom even for
    # SM120 CTA-N shapes of 8 and 16. Match its FP4 selector and use the
    # existing one-/two-register FP6 atoms for those valid small-N kernels.
    patch -Np1 -i "$srcdir/sm120-fp6-small-n-copy-atom.patch"
    # Arch's CUDA loader configuration already exposes the toolkit libraries.
    # Keep CUTLASS's relocatable $ORIGIN paths without embedding /opt paths.
    patch -Np1 -i "$srcdir/system-cuda-rpath.patch"
    patch -Np1 -i "$srcdir/system-cutlass-path.patch"
    patch -Np1 -i "$srcdir/use-ml-dtypes-for-bfloat16.patch"
    # Upstream's explicit package list omits epilogue and EVT even though the
    # public module imports them. Discover every cutlass_cppgen subpackage.
    patch -Np1 -i "$srcdir/complete-cutlass-cppgen-packages.patch"

    # setup_cutlass.py rebuilds pycute and cutlass_library via perform_setup()
    # before its own setup(); that pollutes build/lib and breaks the
    # cutlass_cppgen bdist_wheel. Those two wheels are built separately below,
    # so drop the perform_setup() calls and build only cutlass_cppgen here.
    cd python
    sed -i '/^setup_library\.perform_setup()/d; /^setup_pycute\.perform_setup()/d' setup_cutlass.py
}

build() {
    export PATH="/opt/cuda/bin:$PATH"

    # Let nvcc compile two requested architectures concurrently, while keeping
    # Ninja's outer parallelism within the available CPU allocation.
    local _nvcc_threads=2
    local _allocated_cpus="${SLURM_CPUS_PER_TASK:-${MAX_JOBS:-$(nproc)}}"
    local _jobs=$(( _allocated_cpus / _nvcc_threads ))
    (( _jobs < 1 )) && _jobs=1
    local _memgb=$(awk '/MemTotal/{print int($2/1024/1024)}' /proc/meminfo 2>/dev/null || echo 16)
    # Containers on shared compute nodes can see host MemTotal rather than their
    # allocation. Honour cgroup and Slurm limits when either is smaller.
    local _limit
    for _limit_file in /sys/fs/cgroup/memory.max \
                       /sys/fs/cgroup/memory/memory.limit_in_bytes; do
        [[ -r "$_limit_file" ]] || continue
        read -r _limit < "$_limit_file"
        if [[ "$_limit" =~ ^[0-9]+$ && ${#_limit} -lt 18 ]] &&
           (( _limit < _memgb * 1024 * 1024 * 1024 )); then
            _memgb=$(( _limit / 1024 / 1024 / 1024 ))
        fi
    done
    if [[ "${SLURM_MEM_PER_NODE:-}" =~ ^[0-9]+$ ]] &&
       (( SLURM_MEM_PER_NODE / 1024 < _memgb )); then
        _memgb=$(( SLURM_MEM_PER_NODE / 1024 ))
    fi
    # Use CUTLASS's upstream non-MSVC unity batch of sixteen. Generated unity
    # sources need more than the usual 1024 file descriptors, and two-threaded
    # nvcc processes need a conservative 20 GiB memory budget apiece.
    ulimit -n 65536
    local _memcap=$(( _memgb / 20 )); (( _memcap < 1 )) && _memcap=1
    (( _jobs > _memcap )) && _jobs=$_memcap
    (( _jobs > 96 )) && _jobs=96

    # CUDA 13.x cannot use GCC 16+ as its host compiler. Arch's cuda package
    # depends on gcc15, so fall back to g++-15 when the system g++ is too new.
    local _ccbin=()
    if (( $(gcc -dumpversion | cut -d. -f1) >= 16 )) && [[ -x /usr/bin/g++-15 ]]; then
        export NVCC_CCBIN=/usr/bin/g++-15
        _ccbin=(-DCMAKE_CUDA_HOST_COMPILER=/usr/bin/g++-15)
    fi

    cmake -S $pkgbase-$pkgver -B $pkgbase-$pkgver/build -G Ninja \
        "${_ccbin[@]}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCUTLASS_CUDA_NVCC_FLAGS="--threads=$_nvcc_threads;-Xcompiler=-ffile-prefix-map=$srcdir=${DBGSRCDIR:-/usr/src/debug}/$pkgbase" \
        -DCUTLASS_ENABLE_GTEST_UNIT_TESTS=OFF \
        -DCUTLASS_ENABLE_TESTS=OFF \
        -DCUTLASS_ENABLE_CUBLAS=ON \
        -DCUTLASS_ENABLE_CUDNN=ON \
        -DCUTLASS_ENABLE_EXAMPLES=OFF \
        -DCUTLASS_INSTALL_TESTS=OFF \
        -DCUTLASS_UNITY_BUILD_ENABLED=ON \
        -DCUTLASS_UNITY_BUILD_BATCH_SIZE=16
    cmake --build $pkgbase-$pkgver/build -j $_jobs

    # Build Python wheels
    cd "$srcdir/$pkgbase-$pkgver/python"

    # Build pycute wheel
    rm -rf build *.egg-info
    python setup_pycute.py bdist_wheel

    # Build cutlass_library wheel
    rm -rf build *.egg-info
    python setup_library.py bdist_wheel

    # Build cutlass_cppgen wheel (formerly cutlass)
    rm -rf build *.egg-info
    python setup_cutlass.py bdist_wheel
}

check() {
    cd "$pkgbase-$pkgver"
    # pytest removed this private helper. Preserve its exact CI detection
    # semantics in the upstream sharding tests without depending on internals.
    python - <<'PY'
from pathlib import Path
p = Path('test/utils/test_sharding.py')
s = p.read_text()
old = 'from _pytest.assertion.util import running_on_ci'
assert s.count(old) == 1
p.write_text(s.replace(old, 'def running_on_ci():\n    return any(var in os.environ for var in ("CI", "BUILD_NUMBER"))'))
PY
    # The native upstream test executables require NVIDIA hardware. Exercise
    # the complete CPU/offline PyCuTe and sharding suites instead.
    PYTHONPATH="$PWD/python:$PYTHONPATH" pytest -ra \
        test/python/pycute \
        test/python/cutlass/test_sm120_epilogue_filter.py \
        test/utils/test_sharding.py

    PYTHONPATH="$PWD/python:$PYTHONPATH" python - <<'PY'
import ml_dtypes

import cutlass_cppgen
from cutlass_cppgen import DataType
from cutlass_cppgen.utils.datatypes import bfloat16_library_type, bfloat16_type
from pycute import Layout, composition

layout = Layout((4, 3), (3, 1))
permuted = composition(layout, Layout((6, 2), (2, 1)))
assert [permuted(i) for i in range(permuted.size())] == [
    layout(Layout((6, 2), (2, 1))(i)) for i in range(permuted.size())
]
assert bfloat16_library_type(ml_dtypes.bfloat16) == DataType.bf16
assert bfloat16_type(DataType.bf16) is ml_dtypes.bfloat16
assert int(cutlass_cppgen.cuda.CUdeviceptr(0)) == 0
assert int(cutlass_cppgen.cudart.cudaError_t.cudaSuccess) == 0
print({"version": cutlass_cppgen.__version__, "layout": str(permuted)})
PY

    # Exercise the wheel payload from an isolated destination. In particular,
    # cutlass_cppgen imports EVT unconditionally, so testing the source tree
    # would not detect an omitted subpackage in the built wheel.
    local _check_root="$srcdir/_check"
    rm -rf "$_check_root"
    local _wheel
    for _wheel in "$srcdir/$pkgbase-$pkgver/python/dist/"*.whl; do
        python -m installer --destdir "$_check_root" "$_wheel"
    done
    local _sites=("$_check_root"/usr/lib/python*/site-packages)
    [[ ${#_sites[@]} -eq 1 && -d "${_sites[0]}" ]]
    SOURCE_PYTHON="$srcdir/$pkgbase-$pkgver/python" \
    WHEEL_SITE="${_sites[0]}" \
    PYTHONPATH="${_sites[0]}" python -P - <<'PY'
import os
from pathlib import Path

import cutlass_cppgen
import cutlass_cppgen.backend.evt.ir.tensor
import cutlass_cppgen.epilogue
import cutlass_library
import pycute

source = Path(os.environ["SOURCE_PYTHON"]) / "cutlass_cppgen"
installed = Path(os.environ["WHEEL_SITE"]) / "cutlass_cppgen"
source_files = {path.relative_to(source) for path in source.rglob("*.py")}
installed_files = {path.relative_to(installed) for path in installed.rglob("*.py")}
assert installed_files == source_files, {
    "missing": sorted(map(str, source_files - installed_files)),
    "unexpected": sorted(map(str, installed_files - source_files)),
}
assert Path(cutlass_cppgen.__file__).is_relative_to(installed)
assert Path(cutlass_library.__file__).is_relative_to(Path(os.environ["WHEEL_SITE"]))
assert Path(pycute.__file__).is_relative_to(Path(os.environ["WHEEL_SITE"]))
print({"wheel_python_files": len(installed_files), "evt": "imported"})
PY
    rm -rf "$_check_root"
}

package_cutlass() {
    cmake --install "$srcdir/$pkgbase-$pkgver/build" --prefix "$pkgdir/usr"
    # CMake leaves empty DT_RUNPATH tags on the main library and profiler.
    # Remove those tags; CUDA itself is exposed through the system loader.
    patchelf --remove-rpath "$pkgdir/usr/lib/libcutlass.so"
    patchelf --remove-rpath "$pkgdir/usr/bin/cutlass_profiler"
    install -Dm644 \
        "$srcdir/$pkgbase-$pkgver/LICENSE.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    rm -rf "$pkgdir/usr/test"
}

package_python-cutlass() {
    pkgdesc='Python interface to CUTLASS library'
    arch=('any')
    depends=(
        "cutlass=$pkgver"
        'python'
        'python-cuda>=11.8'
        'python-ml-dtypes'
        'python-networkx'
        'python-numpy'
        'python-pydot'
        'python-scikit-build'
        'python-treelib'
        'pybind11'
    )
    optdepends=(
        'python-cupy: CuPy tensor frontend'
        'python-pytorch: PyTorch tensor frontend and extension emitter'
        'python-rmm: RAPIDS memory-pool backend'
        'python-scipy: NumPy GELU reference activation'
    )

    python -m installer \
        --compile-bytecode 1 \
        --destdir "$pkgdir" \
        "$srcdir/$pkgbase-$pkgver/python/dist/pycute-"*.whl

    python -m installer \
        --compile-bytecode 1 \
        --destdir "$pkgdir" \
        "$srcdir/$pkgbase-$pkgver/python/dist/cutlass_library-"*.whl

    python -m installer \
        --compile-bytecode 1 \
        --destdir "$pkgdir" \
        "$srcdir/$pkgbase-$pkgver/python/dist/cutlass_cppgen-"*.whl

    install -Dm644 \
        "$srcdir/$pkgbase-$pkgver/LICENSE.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
