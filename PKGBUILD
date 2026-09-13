# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Hu Butui <hot123tea123@gmail.com>

pkgname=python-flash-attn
_pkgname=flash-attention
_cutlass_commit=dc4817921edda44a549197ff3a9dcf5df0636e7b
pkgver=2.8.3.post1
pkgrel=1
pkgdesc="Fast and memory-efficient exact attention"
arch=('x86_64')
url="https://github.com/Dao-AILab/flash-attention"
license=('BSD-3-Clause')
depends=(
  'cuda'
  'glibc'
  'libgcc'
  'libstdc++'
  'python'
  'python-einops'
  'python-pytorch-cuda'
)
makedepends=(
  'gcc15'
  'ninja'
  'python-build'
  'python-installer'
  'python-packaging'
  'python-psutil'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)
optdepends=(
  'ninja: building the experimental Hopper FlashAttention-3 extension'
  'python-cutlass: experimental CuTe attention kernels'
  'python-cuda: CUDA Python bindings for experimental CuTe kernels'
  'python-datasets: datasets used by the AMD training utilities'
  'python-hydra-core: block-sparse attention configuration'
  'python-matplotlib: AMD training visualization'
  'python-numpy: AMD Triton test and training utilities'
  'python-packaging: building the experimental Hopper FlashAttention-3 extension'
  'python-pandas: AMD Triton benchmark and training utilities'
  'python-pytest: legacy Triton attention self-tests'
  'python-safetensors: safe model checkpoint loading'
  'python-sentencepiece: Llama tokenizer support'
  'python-setuptools: building the experimental Hopper FlashAttention-3 extension'
  'python-timm: Vision Transformer model support'
  'python-torchvision: stochastic depth and Vision Transformer support'
  'python-transformers: pretrained transformer model utilities'
  'python-triton: Triton attention and fused operators'
  'python-tqdm: AMD training progress reporting'
  'python-wheel: building the experimental Hopper FlashAttention-3 extension'
)
provides=('python-flash-attention')
options=('!debug' '!lto')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/Dao-AILab/flash-attention/archive/refs/tags/v$pkgver.tar.gz"
  "cutlass-$_cutlass_commit.tar.gz::https://github.com/NVIDIA/cutlass/archive/$_cutlass_commit.tar.gz"
  '0001-fix-building-torch-extension-with-glog.patch'
  'cpu-only-test-skip.patch'
)
sha256sums=(
  'd0f5bf63f9051cacc8007213e748f3d4edf3af8cd9b4c08d388eae07cb2ab1d9'
  'f2a3a9df5e6f010c8b02716aa2644a6f071827fafa606fac5f5241cab6a1ab56'
  'cfdc7f13c855599e90861fcfc15ae5d3759b8823ca609a70ddbd061691287137'
  'e7e704be13c6b69c310caf3eaeaeaa195aaacb7d3cfaad965526629ed4ed09fb'
)

prepare() {
  cd "$_pkgname-$pkgver"

  rm -rf csrc/cutlass
  cp -a "$srcdir/cutlass-$_cutlass_commit" csrc/cutlass

  patch -Np1 --fuzz=0 -i "$srcdir/0001-fix-building-torch-extension-with-glog.patch"
  patch -Np1 --fuzz=0 -i "$srcdir/cpu-only-test-skip.patch"
  # Use the declared system Ninja executable, not redundant PyPI metadata.
  sed -i '/^        "ninja",$/d' setup.py
  # Current PyTorch headers use C++20 spaceship/ordering facilities.
  # Apply the same language level to host C++ and CUDA compilation.
  sed -i 's/-std=c++17/-std=c++20/g' setup.py
}

build() {
  cd "$_pkgname-$pkgver"

  export CUDA_HOME=/opt/cuda
  export FLASH_ATTENTION_FORCE_BUILD=TRUE
  export FLASH_ATTENTION_SKIP_CUDA_BUILD=FALSE
  # Keep upstream's complete CUDA target set (Ampere through Blackwell).
  export FLASH_ATTN_CUDA_ARCHS='80;90;100;120'
  export CC=gcc-15
  export CXX=g++-15

  # Ninja workers each launch a multithreaded nvcc process. Budget the total
  # CPU concurrency, not just Ninja workers; bound memory-heavy CUDA compiles.
  export NVCC_THREADS=2
  local _cpus=${SLURM_CPUS_PER_TASK:-${MAX_JOBS:-2}}
  local _jobs=$((_cpus / NVCC_THREADS))
  ((_jobs > 0)) || _jobs=1
  ((_jobs <= 16)) || _jobs=16
  export MAX_JOBS=$_jobs

  # The Arch ninja package supplies the executable but intentionally has no
  # Python distribution metadata for setuptools' redundant setup_requires.
  python -m build --wheel --no-isolation
}

check() {
  local _source_dir="$srcdir/$_pkgname-$pkgver"
  local _test_venv="$srcdir/test-venv"
  local _test_work="$srcdir/test-work"
  rm -rf "$_test_venv" "$_test_work"
  mkdir -p "$_test_work"
  python -m venv --system-site-packages "$_test_venv"
  "$_test_venv/bin/python" -m installer "$_source_dir"/dist/*.whl

  # Account for the complete upstream suite: exactly 30 test_*.py files. The
  # test_util.py file is helper-only; each of the other 29 files executes CUDA,
  # ROCm, Triton, CuTe, or distributed GPU kernels. Preserve their exact list
  # and run the patched primary CUDA suite below as a collected hardware skip.
  mapfile -t _all_test_files < <(
    find "$_source_dir/tests" -type f -name 'test_*.py' -printf '%P\n' | sort
  )
  ((${#_all_test_files[@]} == 30))
  mapfile -t _gpu_test_files < <(
    printf '%s\n' "${_all_test_files[@]}" | grep -vx 'test_util.py'
  )
  ((${#_gpu_test_files[@]} == 29))
  printf '%s\n' "${_gpu_test_files[@]}" > "$srcdir/flash-attn-gpu-test-manifest.txt"

  # The upstream core suite executes CUDA kernels.  On CPU-only build workers,
  # its module-level resource guard records the suite as skipped after loading
  # the compiled extension.
  cd "$_test_work"
  local _pytest_status=0
  CUDA_VISIBLE_DEVICES='' \
  PYTHONDONTWRITEBYTECODE=1 \
    "$_test_venv/bin/python" -m pytest -vv \
      --junitxml="$_test_work/pytest-results.xml" \
      --basetemp="$_test_work/pytest-tmp" \
      "$_source_dir/tests/test_flash_attn.py" || _pytest_status=$?
  # Pytest 9 reports NO_TESTS_COLLECTED (5) when a module-level resource
  # guard is the only collected item.  Accept only the exact expected report:
  # one skip, with no test failure or collection error.
  if (( _pytest_status != 0 )); then
    (( _pytest_status == 5 ))
    "$_test_venv/bin/python" - "$_test_work/pytest-results.xml" <<'PY'
import sys
import xml.etree.ElementTree as ET

root = ET.parse(sys.argv[1]).getroot()
suite = root if root.tag == "testsuite" else root.find("testsuite")
assert suite is not None
assert int(suite.attrib["tests"]) == 1
assert int(suite.attrib["skipped"]) == 1
assert int(suite.attrib["failures"]) == 0
assert int(suite.attrib["errors"]) == 0
PY
  fi

  # Exercise a real CPU-supported workflow from the installed wheel: unpad a
  # variable-length attention batch, then reconstruct its padded layout.
  PYTHONDONTWRITEBYTECODE=1 "$_test_venv/bin/python" - <<'PY'
import torch

import flash_attn
import flash_attn_2_cuda
from flash_attn.bert_padding import pad_input, unpad_input

assert flash_attn.__version__ == "2.8.3.post1"
assert callable(flash_attn_2_cuda.fwd)

hidden = torch.arange(2 * 4 * 2 * 3, dtype=torch.float32).reshape(2, 4, 2, 3)
mask = torch.tensor(
    [[True, True, False, False], [True, True, True, False]],
    dtype=torch.bool,
)
unpadded, indices, cu_seqlens, max_seqlen, used_seqlens = unpad_input(
    hidden, mask
)
assert unpadded.shape == (5, 2, 3)
assert cu_seqlens.tolist() == [0, 2, 5]
assert max_seqlen == 3
assert used_seqlens.tolist() == [2, 3]

restored = pad_input(unpadded, indices, batch=2, seqlen=4)
assert torch.equal(restored[mask], hidden[mask])
assert torch.count_nonzero(restored[~mask]).item() == 0
PY

  # A CPU worker cannot execute the kernels, but cuobjdump can still prove the
  # packaged extension contains every upstream-default architecture.
  local _extension
  local _arch
  _extension=$(
    "$_test_venv/bin/python" -c \
      'import flash_attn_2_cuda; print(flash_attn_2_cuda.__file__)'
  )
  /opt/cuda/bin/cuobjdump --list-elf "$_extension" > "$srcdir/cuobjdump-elf.txt"
  for _arch in 80 90 100 120; do
    grep -q "sm_$_arch" "$srcdir/cuobjdump-elf.txt"
  done

  rm -rf "$_test_venv" "$_test_work"
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
