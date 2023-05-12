# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame
pkgname=python-${_base}
pkgdesc="Framework to build applications in plain Python"
pkgver=2.4.2
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(Apache)
depends=(python-trame-server python-trame-client python-trame-router python-trame-components python-trame-plotly python-trame-markdown python-trame-matplotlib python-trame-deckgl python-trame-vega python-trame-vuetify python-trame-vtk python-trame-simput python-trame-rca)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('ec24c3c0646373e56100706e13c6f0bd322ec1176dd30d93fe4c55808a7b9354ba4d505a3e2248d6fd51d5fdf9bc9797a9582380f79c0a2904471850be65e8bc')

prepare() {
  sed -i 's/^include/#include/' ${_base}-${pkgver}/MANIFEST.in
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
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm ${pkgdir}${site_packages}/trame/__init__.py
  rm ${pkgdir}${site_packages}/trame/modules/__init__.py
  rm ${pkgdir}${site_packages}/trame/ui/__init__.py
  rm ${pkgdir}${site_packages}/trame/widgets/__init__.py
}
