# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pystencils
pkgname=python-${_base}
pkgdesc="Speeding up stencil computations on CPUs and GPUs"
pkgver=2.0
pkgrel=1
arch=(any)
url="https://i10git.cs.fau.de/pycodegen/${_base}"
license=(AGPL-3.0-or-later)
depends=(python-sympy python-numpy python-appdirs python-joblib python-yaml python-fasteners)
makedepends=(python-build python-installer python-setuptools python-versioneer python-wheel)
checkdepends=(python-pytest-cov jupyter-nbformat jupyter-nbconvert python-matplotlib python-pyevtk)
# python-cupy python-islpy python-randomgen python-walberla python-tabulate
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
sha512sums=('4b072f75de00e4cca7d2d83e80f06d93a74137f59fce9368168a2a3d082ef7e5945486fb07d4f78e4c0be375c47f1ff339db6390a2af4285ec50dfe6033e51fd')

prepare() {
  cd ${_base}-release-${pkgver}
  sed -i '1 a import math' tests/test_fvm.py
  sed -i 's/np.math/math/' tests/test_fvm.py
}

build() {
  cd ${_base}-release-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-release-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest \
    -k 'not simplification_strategy' \
    --ignore=tests/test_random.py \
    --ignore=tests/test_vectorization.py
}

package() {
  cd ${_base}-release-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 COPYING.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
