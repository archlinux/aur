# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-torch-einops-utils
_name=torch-einops-utils
pkgver=0.2.9
pkgrel=1
# Upstream does not tag releases. Pin the commit that set version 0.2.9.
_commit=54823d08f30e7a68f33a7689669620ee85427f30
pkgdesc="PyTorch and einops tensor utilities used by lucidrains' model libraries"
arch=('any')
url="https://github.com/lucidrains/torch-einops-utils"
license=('MIT')
depends=(
    'python'
    'python-einops>=0.8.1'
    # Imported at module level by torch_einops_utils, although not declared.
    'python-numpy'
    # Imported at module level by the public save_load submodule.
    'python-packaging'
    'python-pytorch>=2.5'
)
makedepends=('python-build' 'python-hatchling' 'python-installer')
checkdepends=(
    'python-pytest'
    # Two upstream tests use torch.compile. Its CPU Inductor backend imports
    # setuptools, which the official PyTorch package does not declare.
    'python-setuptools'
)
source=("$pkgname-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('3917ba52ba11d1c4e51c3c3d1f34082963843bba641392b38c49347c5dd57e8f')

build() {
    cd "$_name-$_commit"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_name-$_commit"
    local site
    site=$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')
    rm -rf "$srcdir/check-root" "$srcdir/check-suite"
    python -m installer --destdir="$srcdir/check-root" dist/*.whl
    # Run the complete upstream suite outside the checkout against the
    # staged wheel. Upstream's pytest configuration only adds the checkout.
    mkdir -p "$srcdir/check-suite"
    cp -a tests "$srcdir/check-suite/"
    cd "$srcdir/check-suite"
    CUDA_VISIBLE_DEVICES='' PYTHONPATH="$srcdir/check-root$site" \
        python -P -m pytest -ra tests
    PYTHONPATH="$srcdir/check-root$site" python -P - "$srcdir/check-root" <<'PY'
import sys
from pathlib import Path
import torch_einops_utils
assert Path(torch_einops_utils.__file__).resolve().is_relative_to(Path(sys.argv[1]).resolve())
PY
}

package() {
    cd "$_name-$_commit"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
