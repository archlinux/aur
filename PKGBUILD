# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:	Dimitris Kiziridis <ragouel at outlook dot com>
_base=munge
pkgname=python-${_base}
pkgver=1.3.0
pkgrel=1
pkgdesc="Data manipulation client/library"
arch=(any)
url="https://github.com/20c/${_base}"
license=(Apache-2.0)
depends=(python-requests python-click)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest python-toml)
optdepends=('python-toml' 'python-tomlkit' 'python-yaml')
changelog=CHANGELOG.md
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('40abfd618931f97ac59722cf065159a5dfa854c3515670e0f24f7d617bf47e47ab259339796a25d269128c96de77e8a365fe21ee63a41150bbacb7f47159e143')

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
