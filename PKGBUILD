# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Butui Hu <hot123tea123@gmail.com>

_pkgname=timm
pkgname=python-timm
pkgver=1.0.30
pkgrel=1
pkgdesc='PyTorch Image Models'
arch=('any')
url='https://github.com/huggingface/pytorch-image-models'
license=('Apache-2.0')
depends=(
  python-huggingface-hub
  python-numpy
  python-pillow
  python-pytorch
  python-safetensors
  python-scipy
  python-torchvision
  python-yaml
)
makedepends=(
  git
  python-build
  python-installer
  python-pdm-backend
  python-wheel
)
checkdepends=('python-pytest')
source=('source::git+https://github.com/huggingface/pytorch-image-models.git#commit=0df212b369a5385b16dfe513d5143a7311ea1ddc')
sha256sums=('SKIP')

build() {
  cd source
  python -m build --wheel --no-isolation
}

check() {
  cd source
  local _site
  _site=$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')
  python -m installer --destdir="$srcdir/check-root" dist/*.whl
  mkdir -p "$srcdir/test-run"
  cp -a tests pyproject.toml "$srcdir/test-run/"
  cd "$srcdir/test-run"
  # Cover factories, checkpoint loading and core layers on CPU. The exhaustive
  # model matrix and network-hosted pretrained weights are outside this check.
  OMP_NUM_THREADS=2 OPENBLAS_NUM_THREADS=2 PYTHONPATH="$srcdir/check-root$_site" \
    python -m pytest --import-mode=importlib -q \
      tests/test_factory.py tests/test_checkpoint_loading.py \
      tests/test_layers_drop.py tests/test_layers_pool.py
}

package() {
  cd source
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
# vim:set ts=2 sw=2 et:
