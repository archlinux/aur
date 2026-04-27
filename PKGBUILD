# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:	Dimitris Kiziridis <ragouel at outlook dot com>
_base=munge
pkgname=python-${_base}
pkgver=1.4.1
pkgrel=1
pkgdesc="Data manipulation client/library"
arch=(any)
url="https://github.com/20c/${_base}"
license=(Apache-2.0)
depends=(python python-requests python-click)
makedepends=(python-build python-installer python-hatchling)
checkdepends=(python-pytest python-toml)
optdepends=('python-toml' 'python-tomlkit' 'python-yaml')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('9dacf521cffd4779fb5b496ce7e931af32dedd9a0745d783d3c5368c7817fa2471bb02d5f172bd442829efb2754fbd23013d726b8ece9a0be272b4211d7882c0')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests -k 'not toml_library'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
