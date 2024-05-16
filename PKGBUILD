# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pystencils
pkgname=python-${_base}
pkgdesc="Speeding up stencil computations on CPUs and GPUs"
pkgver=1.3.4
pkgrel=1
arch=(any)
url="https://i10git.cs.fau.de/pycodegen/${_base}"
license=(AGPL-3.0-or-later)
depends=(python-sympy python-numpy python-appdirs python-joblib python-yaml)
makedepends=(python-build python-installer python-setuptools python-versioneer python-wheel)
checkdepends=(python-pytest-cov jupyter-nbformat jupyter-nbconvert python-matplotlib python-pyevtk)
# python-cupy python-islpy python-randomgen python-walberla
optdepends=('python-cupy: for gpu support'
  # 'python-islpy: for alltrafos support'
  'python-py-cpuinfo: for alltrafos support'
  'python-blitzdb: for benchdb support'
  'python-pymongo: for benchdb support'
  'python-pandas: for benchdb support'
  'python-matplotlib: for interactive support'
  'python-ipy_table: for interactive support'
  'python-imageio: for interactive support'
  'jupyter-notebook: for interactive support'
  'python-pyevtk: for interactive support'
  'python-rich: for interactive support'
  'python-graphviz: for interactive support')
source=(${url}/-/archive/release/${pkgver}/${_base}-release-${pkgver}.tar.gz)
sha512sums=('454767ec56d0cb7f033e284a728a01714907e0793b39c01ca30330a4f27516c21f4d0da730e9e3a2a0050d1056fa40e002c6cb89119b7c8ac6013604f1c7449f')

build() {
  cd ${_base}-release-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-release-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest \
    --ignore=tests/test_random.py \
    --ignore=tests/test_vectorization.py
}

package() {
  cd ${_base}-release-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
