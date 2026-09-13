# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-optimum-quanto
pkgver=0.2.7
pkgrel=6
pkgdesc='A pytorch quantization backend for optimum'
arch=('any')
url='https://github.com/huggingface/optimum-quanto'
license=('Apache-2.0')
depends=(
    'python'
    'python-pytorch'
    'python-ninja'
    'python-numpy'
    'python-safetensors'
    'python-huggingface-hub'
    'python-setuptools'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools-scm'
)
checkdepends=(
    'python-pytest'
)
optdepends=(
    'python-ruff: for the dev extra (linting)'
    'python-torchvision: for the examples extra'
    'python-transformers: for the examples extra'
    'python-diffusers: for the examples extra'
    'python-datasets: for the examples extra'
    'python-accelerate: for the examples extra'
    'python-sentencepiece: for the examples extra'
    'python-scipy: for the examples extra'
)
_archive="optimum-quanto-${pkgver}"
source=(
    "$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    'include-extension-sources.patch'
)
sha256sums=(
    '0a579ed9049ff3c05f33a7624dd2c3d27af750476e7562717eca3fb8506e4532'
    '5ee911bf77c38bdc4e5bfb5ce1598161dee601d23d110cdb150ace447f7843ed'
)

prepare() {
    cd "$srcdir/${_archive}"
    # Upstream's runtime JIT loaders open these sources from site-packages.
    patch -Np1 -i "$srcdir/include-extension-sources.patch"
}

build() {
    cd "$srcdir/${_archive}"
    # sdist ships no SCM metadata; setuptools_scm needs an explicit version
    export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/${_archive}"

    local _check="$srcdir/_check"
    local _site
    rm -rf "$_check" "$srcdir/_tests"
    python -m installer --destdir="$_check" dist/*.whl
    _site="$_check$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"
    cp -a test "$srcdir/_tests"

    # Build the lazily loaded CPU extension exactly once before pytest. This
    # both validates the sources shipped in the wheel and avoids concurrent
    # first-use loaders racing over the same Ninja output directory.
    CUDA_VISIBLE_DEVICES='' MAX_JOBS="${SLURM_CPUS_PER_TASK:-1}" \
        PYTHONPATH="$_site" python - <<'PY'
from optimum.quanto.library.extensions.cpp import ext

library = ext.lib
assert hasattr(library, "unpack")
print("installed Quanto CPU extension precompile: PASS", ext.build_directory)
PY

    # Run the complete local CPU library, module, quantization, and tensor
    # suites against the wheel. Upstream's models/CLI tests are separate
    # integration jobs requiring optional model stacks and remote checkpoints.
    cd "$srcdir/_tests"
    CUDA_VISIBLE_DEVICES='' PYTHONPATH="$_site" \
        python -m pytest -v -ra library nn quantize tensor

    # Quantize and freeze an installed two-layer model, then prove that its
    # packed state survives a state-dict round trip and remains executable.
    CUDA_VISIBLE_DEVICES='' PYTHONPATH="$_site" python - <<'PY'
import io

import torch
from optimum.quanto import QLinear, freeze, qint4, quantize

model = torch.nn.Sequential(
    torch.nn.Linear(32, 64),
    torch.nn.ReLU(),
    torch.nn.Linear(64, 8),
).eval()
quantize(model, weights=qint4)
freeze(model)
assert isinstance(model[0], QLinear) and isinstance(model[2], QLinear)

inputs = torch.randn(3, 32)
with torch.no_grad():
    expected = model(inputs)
payload = io.BytesIO()
torch.save(model.state_dict(), payload)
payload.seek(0)
reloaded = torch.nn.Sequential(
    QLinear(32, 64, weights=qint4),
    torch.nn.ReLU(),
    QLinear(64, 8, weights=qint4),
).eval()
reloaded.load_state_dict(torch.load(payload, weights_only=True))
with torch.no_grad():
    actual = reloaded(inputs)
torch.testing.assert_close(actual, expected)
print("installed Quanto qint4 freeze/restore workflow: PASS")
PY
}

package() {
    cd "$srcdir/${_archive}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
