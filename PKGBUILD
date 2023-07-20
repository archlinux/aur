# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=neurodiffeq
pkgname=python-${_base}
pkgver=0.6.2
pkgrel=1
pkgdesc="A light-weight & flexible library for solving differential equations using neural networks based on PyTorch"
url="https://github.com/NeuroDiffGym/${_base}"
arch=(any)
license=(MIT)
depends=(python-pytorch tensorboard python-seaborn python-tqdm python-dill)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('f2789c7a27b2e399d78ad7c674e02798cfe054ba3491f51e878e61198d8a221f64de785337ae12b8469ea65292aa2669f296b80b5e9971ef1d8640cae4c8e7bd')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
