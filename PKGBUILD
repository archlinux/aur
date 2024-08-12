# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=CMasher
pkgname=python-${_base,,}
pkgdesc="Scientific colormaps for making accessible, informative and cmashing plots"
pkgver=1.8.0
pkgrel=1
arch=(any)
url="https://github.com/1313e/${_base}"
license=(BSD-3-Clause)
depends=(python-colorspacious python-matplotlib)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-viscm)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('bfed5042847acd377cae12c3b340be0e422648b76c24fb5122e8be1665d16d3fd0af4121d23d3e03eab63f9a97e07dd1461f26b2f960519a5398aa86c59bdc34')

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
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
