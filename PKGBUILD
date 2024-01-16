# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=blacken-docs
pkgdesc="Run black on python code blocks in documentation files"
pkgver=1.16.0
pkgrel=1
arch=(any)
url="https://github.com/asottile/${pkgname}"
license=(MIT)
depends=(python-black)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('78414689fc46386341e0b3246f24fda84b0093c3d9312b1b7ad3a1e263a7e9b97b077d35d6a3c47586c7f354811be349ab40c3a4e03201d9f532dab27b5537cf')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${pkgname}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
