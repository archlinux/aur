# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-fla-core
_srcname=flash-linear-attention
_module=fla
pkgver=0.5.2
pkgrel=1
pkgdesc="Core operations for flash-linear-attention"
arch=('any')
url="https://github.com/fla-org/flash-linear-attention"
license=('MIT')
depends=(
    'python'
    'python-einops'
    'python-numpy'
    'python-packaging'
    'python-pytorch'
    'python-transformers>=4.45'
    'python-triton'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
checkdepends=(
    'python-pytest'
)
optdepends=(
    'python-causal-conv1d: optimized CUDA short-convolution backend'
    'python-flash-attn: FlashAttention backend for MoBA'
    'python-tilelang: TileLang kernels'
)
# fla-core is a split distribution that upstream generates from this repo with
# scripts/build_packages.py (it copies fla/ops + fla/modules + fla/utils.py into a
# standalone tree with its own pyproject). So build from the repo tag, not PyPI.
source=(
    "$_srcname-$pkgver.tar.gz::https://github.com/fla-org/flash-linear-attention/archive/refs/tags/v$pkgver.tar.gz"
    'no-pip-split-validation.py'
)
sha256sums=(
    '7c3132c3d5999aea1888931417fa4525c1c1fbd6243a9d4ea71a125dd3e7a962'
    '296692f71b0d9c2085cd214aedb9f0754fd45416aed682390c00bae27336b5c0'
)

prepare() {
    cd "$srcdir/$_srcname-$pkgver"
    # Upstream's generator builds the split packages with `python -m build` using
    # PEP517 isolation (which would fetch build deps from PyPI). Force the system
    # build backend instead so the whole build stays offline and PyPI-free.
    sed -i 's/"-m", "build", str/"-m", "build", "--no-isolation", "--wheel", str/g' \
        scripts/build_packages.py
    # These selected index/cache tests use ordinary Torch tensor operations,
    # but import the upstream GPU-default device even on CPU-only hosts.
    # Change only their fixture device; all assertions and compiled CPU paths
    # remain selected. Do not change the installed package's device dispatch.
    python - <<'PY'
from pathlib import Path
for name in ('tests/ops/utils/test_index.py', 'tests/models/test_cache.py',
             'tests/layers/test_layer_cache_layer_idx.py'):
    p = Path(name)
    s = p.read_text()
    old = 'from fla.utils import device\n'
    assert s.count(old) == 1, name
    p.write_text(s.replace(old, old + 'if not getattr(torch, device).is_available():\n    device = "cpu"\n'))
p = Path('tests/conftest.py')
s = p.read_text()
old = "if hasattr(device_torch_lib, 'synchronize'):"
assert s.count(old) == 1
p.write_text(s.replace(old, "if device_torch_lib.is_available() and hasattr(device_torch_lib, 'synchronize'):"))
PY
}

build() {
    cd "$srcdir/$_srcname-$pkgver"
    # Generates scripts/dist/fla-core/ (name=fla-core, version=$pkgver) and builds
    # its wheel into scripts/dist/fla-core/dist/.
    python scripts/build_packages.py
}

check() {
    cd "$srcdir/$_srcname-$pkgver"

    # Record accelerator/mixed files separately. Run the complete CPU utility,
    # backend discovery, cache, generation and configuration suites below;
    # their upstream hardware markers skip only actual accelerator operations.
    mapfile -t _gpu_tests < <(find tests -mindepth 2 -type f -name 'test_*.py' \
        ! -path 'tests/utils/test_ascend_ub_manager.py' \
        ! -path 'tests/ops/test_backends.py' \
        ! -path 'tests/ops/utils/test_index.py' \
        ! -path 'tests/models/test_cache.py' \
        ! -path 'tests/models/test_generation_utils.py' \
        ! -path 'tests/models/test_hybrid_attention.py' -printf '%P\n' | sort)
    ((${#_gpu_tests[@]} == 101))
    printf '%s\n' "${_gpu_tests[@]}" > "$srcdir/fla-core-gpu-test-manifest.txt"

    CUDA_VISIBLE_DEVICES='' pytest -ra \
        tests/test_public_api.py \
        tests/test_utils.py \
        tests/utils/test_ascend_ub_manager.py \
        tests/ops/test_backends.py \
        tests/ops/utils/test_index.py \
        tests/models/test_cache.py \
        tests/models/test_generation_utils.py \
        tests/models/test_hybrid_attention.py \
        tests/layers/test_layer_cache_layer_idx.py::test_cache_requires_layer_idx

    # Upstream's remaining split-package test and smoke script invoke pip.
    # Validate the same wheel layout, metadata, isolated install order,
    # namespace composition, model registry and real CPU operation without pip.
    CUDA_VISIBLE_DEVICES='' python "$srcdir/no-pip-split-validation.py" \
        "$PWD" --version "$pkgver"
}

package() {
    cd "$srcdir/$_srcname-$pkgver"
    python -m installer --destdir="$pkgdir" scripts/dist/fla-core/dist/fla_core-*.whl
    install -Dm644 scripts/dist/fla-core/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
