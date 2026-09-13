# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-flash-linear-attention
_pkgname=flash_linear_attention
pkgver=0.5.2
pkgrel=1
pkgdesc="Fast linear attention models and layers (high-level fla package)"
arch=('any')
url="https://github.com/fla-org/flash-linear-attention"
license=('MIT')
depends=(
    'python'
    'python-einops'
    "python-fla-core=$pkgver"
    'python-packaging'
    'python-pytorch'
    'python-transformers'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
checkdepends=(
    'python-pytest'
    'python-triton'
)
optdepends=(
    'python-tilelang: tilelang extra'
    'python-causal-conv1d: conv1d extra (causal-conv1d>=1.4.0)'
    'python-matplotlib: benchmark extra'
    'python-datasets: benchmark extra (datasets>=3.3.0)'
    'python-pytest: test extra'
)
_archive="flash-linear-attention-${pkgver}"
source=(
    "$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    'no-pip-split-validation.py'
)
sha256sums=(
    '7c3132c3d5999aea1888931417fa4525c1c1fbd6243a9d4ea71a125dd3e7a962'
    '296692f71b0d9c2085cd214aedb9f0754fd45416aed682390c00bae27336b5c0'
)

prepare() {
    cd "$srcdir/${_archive}"
    # Upstream's split-package generator invokes PEP 517 isolation by default.
    # Use Arch's packaged build backend and build only wheels, fully offline.
    sed -i 's/"-m", "build", str/"-m", "build", "--no-isolation", "--wheel", str/g' \
        scripts/build_packages.py
    # These selected index/cache tests use ordinary Torch tensor operations,
    # but import the upstream GPU-default device even on CPU-only hosts.
    # Change only their fixture device; all assertions and compiled CPU paths
    # remain selected. Do not change the installed package's device dispatch.
    python - <<'PY'
from pathlib import Path
# Transformers 5 requires a destination-to-source mapping for tied weights.
# All these causal models tie lm_head to their embedding table; Mamba/Samba
# call that table backbone.embeddings rather than model.embeddings.
changed = 0
for p in Path('fla/models').glob('*/modeling_*.py'):
    s = p.read_text()
    old = '_tied_weights_keys = ["lm_head.weight"]'
    if old not in s:
        continue
    assert s.count(old) == 1, p
    prefix = 'backbone' if p.parent.name in ('mamba', 'samba') else 'model'
    assert 'self.embeddings = nn.Embedding(' in s, p
    p.write_text(s.replace(old, '_tied_weights_keys = {"lm_head.weight": "' + prefix + '.embeddings.weight"}'))
    changed += 1
assert changed == 32, changed
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
    cd "$srcdir/${_archive}"
    python scripts/build_packages.py
}

check() {
    cd "$srcdir/${_archive}"

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
    printf '%s\n' "${_gpu_tests[@]}" > "$srcdir/flash-linear-attention-gpu-test-manifest.txt"

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
    cd "$srcdir/${_archive}"
    python -m installer --destdir="$pkgdir" \
        scripts/dist/flash-linear-attention/dist/flash_linear_attention-*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
