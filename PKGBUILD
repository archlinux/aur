# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=Copulas
pkgname=python-${_base,,}
pkgver=0.11.0
pkgrel=2
pkgdesc="Create tabular synthetic data using copulas-based modeling"
arch=(x86_64)
url="https://github.com/sdv-dev/${_base}"
license=(BUSL-1.1)
depends=(python-pandas python-plotly python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('python-markupsafe' 'python-scikit-learn' 'jupyter-notebook')
checkdepends=(python-pytest python-invoke)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
  numpy2.patch::${url}/pull/414.patch)
sha512sums=('51ef4854df8948cd117cd41957ae829d72851ae3d9e9bbf982d04903d988c23cf292d5e1fd61128eb426b7a7daa36e689c821467d8a16d22fb8c5904d588688a'
  '41e96aace81be6a9688a8de385245a751a1c78eac3be0768e536ec13228ef44463c9bae2b7e9ec0d215174a006a6503836a02cf0c1d17b31a1017e69bf1a8dd1')

prepare() {
  cd ${_base}-${pkgver}
  patch -p1 -i ../numpy2.patch
}

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
