# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=blacken-docs
pkgdesc="Run black on python code blocks in documentation files"
pkgver=1.19.1
pkgrel=1
arch=(any)
url="https://github.com/asottile/${pkgname}"
license=(MIT)
depends=(python-black)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('32a5ab9de66726fb1ea36d06e263c764339f6fd86839ed261d23aeaa4134ce9a8107c7c9e6d7b7d8becb706272f7425b0e88f5d4cb02d3ce1127a734b3b1c88d')

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
