# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pystencils
pkgname=python-${_base}
pkgdesc="Speeding up stencil computations on CPUs and GPUs"
pkgver=1.3.5
pkgrel=2
arch=(any)
url="https://i10git.cs.fau.de/pycodegen/${_base}"
license=(AGPL-3.0-or-later)
depends=(python-sympy python-numpy python-appdirs python-joblib python-yaml)
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
source=(${url}/-/archive/release/${pkgver}/${_base}-release-${pkgver}.tar.gz
  sve.patch::${url}/-/commit/e77df63f672ea28cc389c1fadd695338f2985c7d.patch)
sha512sums=('b66b32cbbf949edf8eca70fe599ce69138d8e057a76185ae37885fa9bc1ed768f91a7c7cec4f54579cc3e662b799e2e36a938cd7953ab71531a2bdb15e9ae7e3'
  '197267789bbea5cf0d7acfda032ebbb351ad6658e7050e03e877194d605a02b22255d79cc578a5037fdc04c8168f6861acdeebe4d2364ed4ca8dcdd214d136b9')

prepare() {
  cd ${_base}-release-${pkgver}
  patch -p1 -i ../sve.patch
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
