# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-spandrel-extra-arches
_pkgname=spandrel
_spandrel_ver=0.4.2
pkgver=0.2.0
pkgrel=2
pkgdesc="Additional architecture implementations for Spandrel (PyTorch model loader)"
arch=('any')
url='https://github.com/chaiNNer-org/spandrel'
license=('MIT')
depends=(
  'python'
  'python-spandrel'
  'python-pytorch'
  'python-torchvision'
  'python-numpy'
  'python-einops'
  'python-typing_extensions'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=(
  'python-beautifulsoup4'
  'python-opencv'
  'python-pytest'
  'python-pytest-xdist'
  'python-requests'
  'python-syrupy'
)

source=(
  "$_pkgname-$_spandrel_ver.tar.gz"::"https://github.com/chaiNNer-org/spandrel/archive/refs/tags/v$_spandrel_ver.tar.gz"
)
sha256sums=('1c382c2ef8ebb5fce30d6d0fcf9641a0bd5113881d861896a27645829afc97df')

build() {
  cd "$_pkgname-$_spandrel_ver/libs/spandrel_extra_arches"
  python -m build -nw
}

check() {
  cd "$_pkgname-$_spandrel_ver"

  # Model-weight inference tests download multi-gigabyte checkpoints. Exercise
  # every extra architecture's offline state-dict construction test instead.
  PYTHONPATH="$PWD/libs/spandrel_extra_arches:$PWD/libs/spandrel" pytest -v \
    tests/test_AdaCode.py \
    tests/test_CodeFormer.py \
    tests/test_DDColor.py \
    tests/test_FeMaSR.py \
    tests/test_M3SNet.py \
    tests/test_MAT.py \
    tests/test_MIRNet2.py \
    tests/test_MPRNet.py \
    tests/test_Restormer.py \
    tests/test_SRFormer.py \
    -k test_load

  PYTHONPATH="$PWD/libs/spandrel_extra_arches:$PWD/libs/spandrel" python - <<'PY'
import torch
from spandrel_extra_arches import EXTRA_REGISTRY, install
from spandrel_extra_arches.architectures.MPRNet import MPRNet

installed = install()
assert installed
assert "MPRNet" in EXTRA_REGISTRY

model = MPRNet(
    n_feat=8,
    scale_unetfeats=4,
    scale_orsnetfeats=4,
    num_cab=1,
    reduction=2,
).eval()
image = torch.rand(1, 3, 32, 32)
with torch.no_grad():
    stage3, stage2, stage1 = model(image)
assert stage3.shape == stage2.shape == stage1.shape == image.shape
assert torch.isfinite(stage3).all()
PY
}

package() {
  cd "$_pkgname-$_spandrel_ver"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  python -m installer --compile-bytecode=1 --destdir="$pkgdir" \
    "$srcdir/$_pkgname-$_spandrel_ver"/libs/spandrel_extra_arches/dist/spandrel_extra_arches-"$pkgver"-py3-*-*.whl
}
