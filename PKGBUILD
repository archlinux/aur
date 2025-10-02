# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-compressed-tensors
_pkgname=compressed-tensors
pkgver=0.12.1
pkgrel=1
pkgdesc="versatile and efficient way to store and manage compressed tensor data"
arch=('any')
url='https://github.com/neuralmagic/compressed-tensors'
license=(Apache-2.0)
depends=(python python-pytorch python-safetensors python-pydantic python-accelerate python-numpy python-tqdm python-transformers)
makedepends=(python-build python-installer python-wheel python-setuptools-scm)
checkdepends=(jupyter-nbconvert jupyter-nbformat python-frozendict python-transformers python-loguru)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/neuralmagic/compressed-tensors/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e28f3a43ad08f00eae0a4e3d4997aee8613bd870842997ea6709700db8e91c7f')
prepare(){
  cd $_pkgname-$pkgver
  sed -i -E 's|setuptools_scm[=<>]+[0-9.]+|setuptools_scm|' pyproject.toml
}
build() {
  cd $_pkgname-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver} \
    python -m build --wheel --no-isolation
}
check() {
  cd $_pkgname-$pkgver
  # create a temporary virtualenv for docs and tests
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  PATH="$PWD/test-env/bin:$PATH" \
    PYTHONPATH="$(python -c "import site; print(site.getsitepackages()[0])")" \
    python -m pytest tests \
    --deselect tests/test_quantization/lifecycle/test_apply.py \
    --deselect tests/test_quantization/lifecycle/test_dynamic_lifecycle.py
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim:set ts=2 sw=2 et:
