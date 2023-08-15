# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=blacken-docs
pkgdesc="Run black on python code blocks in documentation files"
pkgver=1.15.0
pkgrel=1
arch=(any)
url="https://github.com/asottile/${pkgname}"
license=(MIT)
depends=(python-black)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('c3c5b2f7e90de86fdea571a8b123c4f48d1c3d502280bb00c9f221065e9c218e5cecbe0538b878858e537b409807f14bad34a8b65f8d11900f1409de5f0a0df0')

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
