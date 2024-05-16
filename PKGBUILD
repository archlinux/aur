# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=monty
pkgname=python-${_base}
pkgdesc="Missing complement to Python"
pkgver=2024.5.15
pkgrel=1
arch=(x86_64)
url="https://github.com/materialsvirtuallab/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-bson python-pandas python-pydantic
  python-ruamel-yaml python-tqdm python-pytorch)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('fa52501eb7509ec2be6003ecd99dc6efcd05a35d87387caf1b1244b3b107b2945e072b6a3011720f9926f9d1cbef13feee121cb5166f9be3666516ed56f1963d')

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
  install -Dm 644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
