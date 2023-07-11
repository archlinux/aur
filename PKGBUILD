# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
_base=etils
pkgname=python-${_base}
pkgver=1.3.0
pkgrel=2
pkgdesc="Collection of common python utils"
url="https://github.com/google/${_base}"
license=(Apache)
arch=(any)
depends=(python)
makedepends=(python-build python-installer python-flit-core python-wheel)
checkdepends=(python-pytest-subtests python-numpy python-typing_extensions python-absl ipython
  python-jax python-importlib_resources python-tensorflow python-tqdm python-pytorch) # python-simple_parsing python-chex
optdepends=('python-numpy: for etils.array_types, etils.ecolab, etils.enp'
  'ipython: for etils.ecolab'
  # 'python-mediapy: for etils.ecolab'
  'python-importlib_resources: for epath'
  'python-zipp: for etils.epath'
  'python-typing_extensions: for etils.epy'
  'python-absl: for etils.etqdm'
  'python-tqdm: for etils.etqdm'
  'python-dm-tree: for etils.etree.tree'
  'python-jax: for etils.etree.jax'
  'python-tensorflow: for etils.etree.nest'
)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('6f42a75d610b845e96bf1f56173f1dcf8b8d9289f583df890acd77bb85d9d0b433b2d84128fa7b346e1ab4d220d8213ca5636cdc0bba1cfdf8352b3d889421cc')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest \
    --ignore etils/ecolab/array_as_img_test.py \
    --ignore etils/eapp/dataclass_flags_test.py \
    --ignore etils/ecolab/colab_utils_test.py \
    --ignore etils/ecolab/inspects/attrs_test.py \
    --ignore etils/ecolab/inspects/html_helper_test.py \
    --ignore etils/ecolab/inspects/nodes_test.py \
    --ignore etils/ecolab/lazy_imports_test.py \
    --ignore etils/ecolab/test_utils.py \
    --ignore etils/edc/frozen_utils_test.py \
    --ignore etils/etree/tree_utils_test.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
