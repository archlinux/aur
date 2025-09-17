# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=multicollections
pkgname=python-${_base}
pkgdesc="Fully generic MultiDict class"
pkgver=1.0.4
pkgrel=1
arch=(any)
url="https://github.com/gerlero/${_base}"
license=(Apache-2.0)
depends=(python)
makedepends=(python-build python-installer python-uv-build)
checkdepends=(python-pytest python-multidict)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('24f92418a9a6dd424b6c14774600e2d2f24b058b06a2d70cc65fc5096f4b464205b3dd0a67441d585c39c85237f648e362f06ebed026bf2f3974f8d72a05eec4')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
