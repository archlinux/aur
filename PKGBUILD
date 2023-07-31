# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
_base=etils
pkgname=python-${_base}
pkgver=1.4.1
pkgrel=1
pkgdesc="Collection of common python utils"
url="https://github.com/google/${_base}"
license=(Apache)
arch=(any)
depends=(python)
makedepends=(python-build python-installer python-flit-core python-wheel)
checkdepends=(python-pytest-subtests python-numpy python-typing_extensions
  python-absl ipython python-jax python-importlib_resources python-tensorflow
  python-tqdm python-pytorch) # python-simple_parsing python-chex python-dataclass_array
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
sha512sums=('10a8e3b10eaa52e931ee522fe662acfe81bfe915b6e92b825c60c185ac86d0adb36867a7b627bc33c6a482a33f6e05dc37063534ca65e0460b844597aab398ef')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest \
    --ignore etils/eapp/dataclass_flags_test.py \
    --ignore etils/ecolab/array_as_img_test.py \
    --ignore etils/ecolab/colab_utils_test.py \
    --ignore etils/ecolab/inplace_reload_test.py \
    --ignore etils/ecolab/lazy_imports_test.py \
    --ignore etils/ecolab/test_utils.py \
    --ignore etils/ecolab/inspects/attrs_test.py \
    --ignore etils/ecolab/inspects/html_helper_test.py \
    --ignore etils/ecolab/inspects/nodes_test.py \
    --ignore etils/edc/frozen_utils_test.py \
    --ignore etils/epy/lazy_imports_utils_test.py \
    --ignore etils/etree/tree_utils_test.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
