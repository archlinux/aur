# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-liger-kernel
_pkgname=Liger-Kernel
pkgver=0.8.2
pkgrel=1
pkgdesc="Efficient Triton kernels for LLM training"
arch=('any')
url="https://github.com/linkedin/Liger-Kernel"
license=('BSD-2-Clause')
depends=(
    'python'
    'python-pytorch>=2.1.2'
    'python-triton>=2.3.1'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-scm'
    'python-wheel'
)
checkdepends=(
    'python-pytest'
    'python-transformers>=4.52.0'
)
optdepends=(
    'python-transformers>=4.52.0: for Hugging Face Transformers integration'
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/linkedin/Liger-Kernel/archive/refs/tags/v$pkgver.tar.gz"
    'experimental-ops-package.patch'
)
sha256sums=('85c4b7cdee9849fb7ec98770514048680df45d66556f0279ccc85bc4d5a26058'
            '38554a4ae52740d8470829b10bd07b7edd227eb125bae3288fef138b6aadcfc8')

prepare() {
    cd "$_pkgname-$pkgver"

    # Upstream imports this namespace from ops/__init__.py, but the release
    # omitted its __init__.py while setuptools has namespaces disabled.
    patch -Np1 -i "$srcdir/experimental-ops-package.patch"

}

build() {
    cd "$_pkgname-$pkgver"
    SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    local site_packages
    site_packages="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"
    rm -rf "$srcdir/_check" "$srcdir/_test-run"
    python -m installer --destdir="$srcdir/_check" dist/*.whl
    install -d "$srcdir/_test-run/test/transformers"
    cp test/__init__.py test/utils.py "$srcdir/_test-run/test/"
    cp test/transformers/test_monkey_patch.py "$srcdir/_test-run/test/transformers/"
    cd "$srcdir/_test-run"

    # Every numerical kernel in the remaining upstream suite requires a GPU.
    # This CPU-capable integration file exercises the complete model mapping,
    # signature validation, and in-place Hugging Face monkey-patching surface.
    PYTHONPATH="$srcdir/_test-run:$srcdir/_check$site_packages" \
        pytest -o addopts='' test/transformers/test_monkey_patch.py

    PYTHONPATH="$srcdir/_check$site_packages" python - <<'PY'
from transformers import LlamaConfig, LlamaForCausalLM
from liger_kernel.transformers import apply_liger_kernel_to_llama

model = LlamaForCausalLM(LlamaConfig(
    vocab_size=128,
    hidden_size=32,
    intermediate_size=64,
    num_hidden_layers=2,
    num_attention_heads=4,
))
apply_liger_kernel_to_llama(
    model=model,
    rope=True,
    rms_norm=True,
    swiglu=True,
    cross_entropy=False,
    fused_linear_cross_entropy=False,
)
assert model.model.norm._get_name() == 'LigerRMSNorm'
for layer in model.model.layers:
    assert layer.input_layernorm._get_name() == 'LigerRMSNorm'
    assert layer.post_attention_layernorm._get_name() == 'LigerRMSNorm'
    assert layer.mlp._get_name() == 'LigerSwiGLUMLP'
print('Liger installed-wheel model patch workflow passed')
PY
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
