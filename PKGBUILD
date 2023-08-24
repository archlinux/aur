# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=python-safetensors
pkgver=0.3.3
pkgrel=1
pkgdesc='Simple, safe way to store and distribute tensors'
arch=('x86_64')
url='https://github.com/huggingface/safetensors'
license=('Apache')
depends=('python')
makedepends=('python-build'
             'python-installer'
             'python-wheel'
             'python-setuptools-rust')
optdepends=('python-jax'
            'python-flax'
            'python-jaxlib'
            'python-numpy'
            'python-paddlepaddle'
            'python-tensorflow'
            'python-pytorch')
checkdepends=('python-pytorch'
              'python-numpy'
              'python-tensorflow'
              'python-jax'
              'python-flax'
              'python-jaxlib'
              # 'python-paddlepaddle'
              'python-black'
              'python-isort'
              'flake8'
              'python-click'
              'python-huggingface-hub'
              'python-pytest'
              'python-pytest-benchmark'
              'python-h5py')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('a19b390b6c36e4cf086835b2ea91a7b107be0833c0fe654db1a13f3f4ad431afa03ba9cec9c04ad7294cc28fb9e2a6d8ff31f1009cbf5da743e7d62652683bff')

build() {
  cd "safetensors-${pkgver}/bindings/python"
  python -m build --wheel --no-isolation
}

check() {
  cd "safetensors-${pkgver}/bindings/python"
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-cpython-${python_version}" pytest tests/ \
    --ignore=tests/test_paddle_comparison.py # No working paddlepaddle package, disable it temporarily
}

package() {
  cd "safetensors-${pkgver}/bindings/python"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
