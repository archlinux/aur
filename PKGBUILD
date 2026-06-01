# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-unsloth
_pkgname=unsloth
pkgver=2026.5.8
pkgrel=1
pkgdesc="2-5x faster LLM fine-tuning with 70% less memory"
arch=('any')
url="https://github.com/unslothai/unsloth"
license=('Apache-2.0')
depends=(
    'python'
    'python-unsloth-zoo>=2026.5.4'
    'python-pytorch'
    'python-torchvision'
    'python-triton'
    'python-numpy'
    'python-packaging'
    'python-psutil'
    'python-tqdm'
    'python-protobuf'
    'python-sentencepiece'
    'python-transformers'
    'python-datasets'
    'python-accelerate'
    'python-peft'
    'python-trl'
    'python-huggingface-hub'
    'python-hf-transfer'
    'python-diffusers'
    'python-tyro'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-scm'
    'python-wheel'
)
optdepends=(
    'python-bitsandbytes: for 4-bit/8-bit quantization'
    'python-xformers: for memory-efficient attention'
    'python-sentence-transformers: for embedding models'
    'python-nest-asyncio: OpenEnv EnvClient async compatibility'
)
source=("$pkgname-$pkgver.tar.gz::https://pypi.io/packages/source/u/unsloth/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('c2e1269507f32c0565eabc0f4f98b5d73644d2f78c9a222f0e9aad16af44ee54')

prepare() {
    cd "$_pkgname-$pkgver"
    # Relax exact build system pins
    sed -i 's/setuptools==80.9.0/setuptools>=80.0.0/' pyproject.toml
    sed -i 's/setuptools-scm==9.2.0/setuptools-scm>=9.2.0/' pyproject.toml
    # Allow newer Python (drop the upstream upper bound)
    sed -i 's/requires-python = ">=3.9,<3.15"/requires-python = ">=3.9"/' pyproject.toml
    # Relax version pins for Arch rolling release: strip upstream upper bounds so
    # Arch's newer torch/transformers/datasets/trl satisfy the metadata, and relax
    # the peft floor (Arch ships 0.17.1, below upstream's >=0.18.0).
    sed -i 's/torch>=2.4.0[^";]*<2.11.0/torch>=2.4.0/g' pyproject.toml
    sed -i 's/transformers>=4.51.3[^"]*<=5.5.0/transformers>=4.51.3/g' pyproject.toml
    sed -i 's/datasets>=3.4.1[^"]*<4.4.0/datasets>=3.4.1/g' pyproject.toml
    sed -i 's/trl>=0.18.2[^"]*<=0.24.0/trl>=0.18.2/g' pyproject.toml
    sed -i 's/peft>=0.18.0[^"]*/peft>=0.17.0/g' pyproject.toml
    # Move bitsandbytes and xformers out of core deps (handled via optdepends)
    sed -i '/bitsandbytes/d' pyproject.toml
    sed -i '/xformers/d' pyproject.toml
}

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    # Full import requires a GPU; verify version from source instead
    python -c "
import ast
tree = ast.parse(open('unsloth/models/_utils.py').read())
for node in ast.walk(tree):
    if isinstance(node, ast.Assign):
        for target in node.targets:
            if isinstance(target, ast.Name) and target.id == '__version__':
                ver = node.value.value
                assert ver == '$pkgver', f'Version mismatch: {ver} != $pkgver'
                print(f'unsloth version {ver} OK')
                break
"
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
