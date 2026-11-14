# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-torch-einops-utils
_name=torch-einops-utils
pkgver=0.2.6
pkgrel=1
# Upstream does not tag releases. Pin the commit that set version 0.2.6.
_commit=4e720ee5cc66d653ba573d22cc87a11bde39f791
pkgdesc="PyTorch and einops tensor utilities used by lucidrains' model libraries"
arch=('any')
url="https://codeberg.org/lucidrains/torch-einops-utils"
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
sha256sums=('06104f85babd5ebcb3d6abb40f131c0d39bfb7da2474eb31eaa6a68fabbc0f63')

build() {
    cd "$_name"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_name"
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
    cd "$_name"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
