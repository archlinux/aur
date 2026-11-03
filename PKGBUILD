# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-flash-linear-attention
_pkgname=flash_linear_attention
pkgver=0.6.0
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
    'python-pytorch>=2.7'
    'python-transformers>=5.6.2'
    'python-transformers<6'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
checkdepends=(
    'python-pytest'
    'python-triton>=3.3'
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
    '9d1bd45a0151561c05f41c4f09c9fbe41380c013f4102398db0ed53acea5c008'
    '72acc3da18c34853e19311511307cb17636e68aec812b5efeeb4b649d3d95c15'
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
for name in ('tests/ops/utils/test_index.py',
             'tests/layers/test_layer_cache_layer_idx.py'):
    p = Path(name)
    s = p.read_text()
    old = 'from fla.utils import device\n'
    assert s.count(old) == 1, name
    p.write_text(s.replace(old, old + 'if not getattr(torch, device).is_available():\n    device = "cpu"\n'))
# Cache fixtures now use the normalized device_name alias as well.
p = Path('tests/models/test_cache.py')
s = p.read_text()
old = 'from fla.utils import assert_close, device, device_name\n'
assert s.count(old) == 1
p.write_text(s.replace(old, old + 'if not getattr(torch, device).is_available():\n    device = device_name = "cpu"\n'))

PY
}

build() {
    cd "$srcdir/${_archive}"
    python scripts/build_packages.py
}

check() {
    cd "$srcdir/${_archive}"

    # Representative upstream CPU API, indexing, cache and generation checks.
    # Kernel execution is validated separately on allocated accelerators.
    # Install both generated distributions to preserve their namespace contract.
    local _check="$srcdir/fla-check" _tests="$srcdir/fla-tests" _site
    rm -rf "$_check" "$_tests"
    mkdir -p "$_tests"
    python -m installer --destdir="$_check" scripts/dist/fla-core/dist/*.whl
    python -m installer --destdir="$_check" scripts/dist/flash-linear-attention/dist/*.whl
    _site="$_check$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"
    cp -a tests "$_tests/"
    printf '[pytest]\n' > "$_tests/pytest.ini"
    cd "$_tests"
    CUDA_VISIBLE_DEVICES='' PYTHONPATH="$_site" FLA_CHECK_SITE="$_site" \
        python -P - <<'PYTEST'
import os
from pathlib import Path
import pytest
import fla
assert Path(fla.__file__).resolve().is_relative_to(Path(os.environ["FLA_CHECK_SITE"]).resolve())
raise SystemExit(pytest.main([
    "-ra", "-c", "pytest.ini",
    "tests/test_public_api.py",
    "tests/test_utils.py",
    "tests/utils/test_ascend_ub_manager.py",
    "tests/ops/test_backends.py",
    "tests/ops/utils/test_index.py",
    "tests/models/test_cache.py",
    "tests/models/test_hybrid_attention.py",
    "tests/models/test_generation.py::test_generate",
    "tests/models/test_generation.py::test_generate_cache_error",
    "tests/models/test_generation.py::test_generate_attribute_error",
    "tests/models/test_generation.py::test_prepare_inputs_for_generation",
    "tests/models/test_generation.py::test_prepare_inputs_for_generation_decode_without_cache",
    "tests/models/test_generation.py::test_prepare_inputs_cached",
    "tests/layers/test_layer_cache_layer_idx.py::test_cache_requires_layer_idx",
]))
PYTEST
    cd "$srcdir/flash-linear-attention-$pkgver"

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
