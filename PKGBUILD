# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-torchprofile
_pkgname=torchprofile
pkgver=0.1.0
pkgrel=2
pkgdesc="Profiler to count the number of MACs / FLOPs of PyTorch models"
arch=('any')
url="https://github.com/zhijian-liu/torchprofile"
license=('MIT')
depends=(
  'python'
  'python-pytorch'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
checkdepends=(
  'python-pytest'
  'python-torchvision'
  'python-transformers'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/zhijian-liu/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ce1c4838cc70ce5e1f6d46913357bc302d49d80a45e0bf0fdf98213b34ee28de')

build() {
  cd "$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"

  local _check="$srcdir/_check"
  local _site
  rm -rf "$_check" "$srcdir/_tests"
  python -m installer --destdir="$_check" dist/*.whl
  _site="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"
  cp -a tests "$srcdir/_tests"

  cd "$srcdir/_tests"
  # Run every upstream operator and end-to-end model profile against the wheel.
  PYTHONPATH="$_check$_site" pytest -v

  PYTHONPATH="$_check$_site" python - <<'PY'
import torch
from torch import nn

from torchprofile import profile_macs

model = nn.Sequential(
    nn.Conv2d(3, 4, kernel_size=3, bias=False),
    nn.ReLU(),
    nn.Flatten(),
    nn.Linear(4 * 6 * 6, 10, bias=False),
).eval()
macs = profile_macs(model, torch.randn(1, 3, 8, 8))
assert macs == 5328, macs
PY
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
