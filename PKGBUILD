# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Germán Osella Massa <gosella@gmail.com>
_base=mpld3
pkgname=python-${_base}
pkgver=0.5.12
pkgrel=1
pkgdesc="D3 Viewer for Matplotlib"
arch=(any)
url="https://${_base}.github.io"
license=(BSD-3-Clause)
depends=(python-jinja python-matplotlib)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('534cbfce3d6fd5dece1dc7b9c01f2e1c930bcaa064c6c84a5a1eb5fe9a84dc5cf8a4817c08aef3b7f489e60351b3739b8a2ca733d277a4caa4387db0afa4f360')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest --ignore=${_base}/tests/test_d3_snapshots.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
