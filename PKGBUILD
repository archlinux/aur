# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Germán Osella Massa <gosella@gmail.com>
_base=mpld3
pkgname=python-${_base}
pkgver=0.5.10
pkgrel=2
pkgdesc="D3 Viewer for Matplotlib"
arch=(any)
url="https://${_base}.github.io"
license=(BSD-3-Clause)
depends=(python-jinja python-matplotlib)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('3c5426e4413ce57fdf388af5fdfaae3ec4496da56e2ac0576a98b1246cedc646ccec61c8b96a381bb150512378de39e997133c190f7ae8d3872ea627933a0857')

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
