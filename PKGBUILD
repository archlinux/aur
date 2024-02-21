# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ashwin <ashwinvis+arch_@t_Pr0t0nM4il_c0m>
_base=transonic
pkgname=python-${_base}
pkgver=0.6.3
pkgrel=1
pkgdesc="Make your Python code fly at transonic speeds!"
arch=(any)
url="https://foss.heptapod.net/fluiddyn/${_base}"
license=(BSD-3-clause)
depends=(autopep8 python-beniget python-gast python-numpy)
makedepends=(python-build python-installer python-pdm python-wheel)
checkdepends=(python-pytest)
optdepends=('python-pythran: compiler backend'
  'python-numba: compiler backend'
  'cython: compiler backend'
  'python-rich: colourful logs')
provides=(${_base})
source=(${_base}-${pkgver}.tar.gz::${url}/-/archive/${pkgver}/${_base}-${pkgver}.tar.gz)
sha512sums=('452606279c4c0d38ccd688a2db5801a3eab0808dab18570a4963d7a4224dc7cc437585f68822e966bd4618ce0b577619388d359895d4547c032a7606b5a05566')
build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests -k 'not install_package and not justintime and not init'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
