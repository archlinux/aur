# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: redponike <proton (dot) me>
# Contributor: Alex Hirzel <alex at hirzel period us>
# Contributor: Butui Hu <hot123tea123@gmail.com>

pkgname=python-torchmetrics
_pkgname=${pkgname#python-}
pkgver=1.9.0
pkgrel=3
pkgdesc='Machine learning metrics for distributed, scalable PyTorch applications'
arch=('any')
url='https://github.com/Lightning-AI/torchmetrics'
license=('Apache-2.0')
depends=(
  'python'
  'python-lightning-utilities>=0.15.3'
  'python-numpy'
  'python-packaging'
  'python-pytorch'
)
optdepends=(
  'python-einops: Multimodal subdomain dependency'
  'python-timm: Multimodal subdomain dependency'
  'python-nltk: Text subdomain dependency'
  'python-regex: Text subdomain dependency'
  'python-sentencepiece: Text subdomain dependency'
  'python-transformers: Text and multimodel subdomains dependency'
  'python-tqdm: Text subdomain dependency'
  'python-onnxruntime: Audio subdomain dependency'
  'python-requests: Audio subdomain dependency'
  'python-torchaudio: Audio subdomain dependency'
  'python-scipy: Image subdomain dependency'
  'python-torch-fidelity: Image subdomain dependency'
  'python-torchvision: Image and detection subdomains dependency'
  'python-pycocotools: Detection subdomain dependency'
  'python-matplotlib: Visual subdomain dependency'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
checkdepends=(
  'python-cloudpickle'
  'python-psutil'
  'python-pytest'
  'python-scikit-learn'
  'python-scipy'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('30d4f63efab5a3aec26e1a22510e36e6076d07ef0d1feca7b373319263140f59')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --no-isolation --wheel
}

check() {
  cd "${_pkgname}-${pkgver}"
  local _checkroot="$srcdir/_check" _site
  rm -rf "$_checkroot"
  python -m installer --destdir="$_checkroot" dist/*.whl
  _site=$(python -c 'import site; print(site.getsitepackages()[0])')
  cp -a tests/unittests "$_checkroot/unittests"
  # cachier is used only to memoize generated test references. Replace that
  # optional development helper with a no-op decorator; assertions are intact.
  sed -i \
    '/from cachier import cachier/c\def cachier(*args, **kwargs):\n    return lambda function: function' \
    "$_checkroot/unittests/__init__.py"

  cd "$_checkroot"
  # Exercise the complete base, pairwise, retrieval and shape groups. The
  # other domains deliberately require the optional audio/image/text stacks.
  PYTHONPATH="$_checkroot$_site:$_checkroot" pytest -ra -c /dev/null \
    unittests/bases \
    unittests/pairwise \
    unittests/retrieval \
    unittests/shape

  PYTHONPATH="$_checkroot$_site" python - <<'PY'
import torch
from torchmetrics.classification import MulticlassAccuracy
from torchmetrics.regression import MeanSquaredError

accuracy = MulticlassAccuracy(num_classes=3)
accuracy.update(
    torch.tensor([[0.1, 0.8, 0.1], [0.9, 0.05, 0.05], [0.1, 0.2, 0.7]]),
    torch.tensor([1, 0, 2]),
)
assert torch.isclose(accuracy.compute(), torch.tensor(1.0))
mse = MeanSquaredError()
mse.update(torch.tensor([1.0, 2.0, 4.0]), torch.tensor([1.0, 3.0, 2.0]))
assert torch.isclose(mse.compute(), torch.tensor(5.0 / 3.0))
print("staged stateful classification and regression metrics workflow passed")
PY
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
