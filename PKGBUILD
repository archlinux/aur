# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-compressed-tensors
_pkgname=compressed-tensors
pkgver=0.9.2
pkgrel=1
pkgdesc="extends the safetensors format, providing a versatile and efficient way to store and manage compressed tensor data"
arch=('any')
url='https://github.com/neuralmagic/compressed-tensors'
license=(Apache-2.0)
depends=(python python-pytorch python-safetensors python-pydantic python-accelerate python-numpy python-tqdm python-transformers)
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=(jupyter-nbformat python-transformers)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/neuralmagic/compressed-tensors/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('59754040e9985d3012e9de3cf2b891dee2e93ca0de0de5e5bbdcf0c7a6c96d6a')

build() {
  cd $_pkgname-$pkgver
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
    python -m pytest tests
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim:set ts=2 sw=2 et:
