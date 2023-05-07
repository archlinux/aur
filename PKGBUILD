# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=blacken-docs
pkgdesc="Run black on python code blocks in documentation files"
pkgver=1.13.0
pkgrel=1
arch=(any)
url="https://github.com/asottile/${pkgname}"
license=(MIT)
depends=(python-black)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('82f3fc9df0dc964451c0d409c0bb22f067d56010cdfee7bd86e2c972d75f395d97407bd77f0273823943978716805b6080c9c32c19a9324806c301ac51329d88')

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
