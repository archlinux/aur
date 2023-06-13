# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=mknapsack
pkgname=python-${_base}
pkgver=1.1.12
pkgrel=1
pkgdesc="Solving knapsack and bin packing problems with Python"
arch=(x86_64)
url="https://github.com/jmyrberg/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(gcc-fortran python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('494574c70adb7675136cbf148b3129fccc3f1559d8c49db3e64c82182f77ca453b1e4dadd2f557e3161e93232707b472b4f260d12f4871075b15b7b17501855e')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  export SETUPTOOLS_ENABLE_FEATURES="legacy-editable"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  # https://stackoverflow.com/a/41752043/9302545
  rm ${_base}-${pkgver}/${_base}/tests/__init__.py
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer ${_base}-${pkgver}/dist/*.whl
  test-env/bin/python -m pytest ${_base}-${pkgver}/${_base}/tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
