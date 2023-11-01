# Maintainer: Andrea Manenti <andrea [dot] manenti [at] yahoo [dot] com>
# Contributor: Henry-ZHR <henry-zhr@qq.com>
pkgname=python-safetensors
pkgver=0.4.0
pkgrel=1
pkgdesc='Simple, safe way to store and distribute tensors'
arch=('x86_64')
url='https://github.com/huggingface/safetensors'
license=('Apache')
depends=('python')
makedepends=('python-build'
             'python-installer'
             'python-maturin'
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
sha512sums=('da38f184f2c0730a59b1d4ca490758b71cb5ed3e1e16741bbf4b7bfac35fa1a4f24e5acbc35f3b38f10e4c46d81554896fbd95accfd671ee066c9fcbd50551ab')

build() {
  cd "safetensors-${pkgver}/bindings/python"
  python -m build --wheel --no-isolation
}

check() {
  cd "safetensors-${pkgver}/bindings/python"
  local python_version=$(python -V | sed -e 's/Python \([0-9]\.[0-9]\+\)\..*/\1/')
  mkdir "${PWD}/test_build"
  python -m installer --destdir="${PWD}/test_build" dist/*.whl
  PYTHONPATH="${PWD}/test_build/usr/lib/python${python_version}/site-packages" pytest tests/ \
    --ignore=tests/test_paddle_comparison.py # No working paddlepaddle package, disable it temporarily
}

package() {
  cd "safetensors-${pkgver}/bindings/python"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
