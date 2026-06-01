# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-unsloth-zoo
_pkgname=unsloth_zoo
pkgver=2026.5.4
pkgrel=1
pkgdesc="Utility functions for Unsloth fine-tuning framework"
arch=('any')
url="https://github.com/unslothai/unsloth-zoo"
license=('LGPL-3.0-or-later')
depends=(
    'python'
    'python-pytorch'
    'python-triton'
    'python-numpy'
    'python-packaging'
    'python-psutil'
    'python-tqdm'
    'python-protobuf'
    'python-pillow'
    'python-regex'
    'python-typing_extensions'
    'python-filelock'
    'python-sentencepiece'
    'python-transformers'
    'python-datasets'
    'python-accelerate'
    'python-peft'
    'python-trl'
    'python-huggingface-hub'
    'python-hf-transfer'
    'python-cut-cross-entropy'
    'python-torchao'
    'python-tyro'
    'python-msgspec'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-scm'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::https://pypi.io/packages/source/u/unsloth-zoo/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('593db637efa2b874287474745674bbc8caf414c3250979fbb3e113fec412e844')

prepare() {
    cd "$_pkgname-$pkgver"
    # Relax exact build system pins
    sed -i 's/setuptools==80.9.0/setuptools>=80.0.0/' pyproject.toml
    sed -i 's/setuptools-scm==9.2.0/setuptools-scm>=9.2.0/' pyproject.toml
    # Allow newer Python (drop the upstream upper bound)
    sed -i 's/requires-python = ">=3.9,<3.15"/requires-python = ">=3.9"/' pyproject.toml
    # Relax version pins for Arch rolling release: strip upstream upper bounds
    # so Arch's newer transformers/datasets/trl/torch satisfy the metadata, and
    # relax the peft floor (Arch ships 0.17.1, below upstream's >=0.18.0).
    sed -i 's/transformers>=4.51.3[^"]*<=5.5.0/transformers>=4.51.3/g' pyproject.toml
    sed -i 's/datasets>=3.4.1[^"]*<4.4.0/datasets>=3.4.1/g' pyproject.toml
    sed -i 's/trl>=0.18.2[^"]*<=0.24.0/trl>=0.18.2/g' pyproject.toml
    sed -i 's/torch>=2.4.0[^";]*<2.13.0/torch>=2.4.0/g' pyproject.toml
    sed -i 's/peft>=0.18.0[^"]*/peft>=0.17.0/g' pyproject.toml
}

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    # Cannot import unsloth_zoo directly since __init__.py requires unsloth (circular dep)
    python -c "
import ast
tree = ast.parse(open('unsloth_zoo/__init__.py').read())
for node in ast.walk(tree):
    if isinstance(node, ast.Assign):
        for target in node.targets:
            if isinstance(target, ast.Name) and target.id == '__version__':
                ver = node.value.value
                assert ver == '$pkgver', f'Version mismatch: {ver} != $pkgver'
                print(f'unsloth_zoo version {ver} OK')
                break
"
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
