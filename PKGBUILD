# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=monty
pkgname=python-${_base}
pkgdesc="Missing complement to Python"
pkgver=2024.2.2
pkgrel=1
arch=(x86_64)
url="https://github.com/materialsvirtuallab/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-bson python-pandas python-pydantic python-ruamel-yaml python-tqdm python-pytorch)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('18cb86b92423316c35af9e2a1c13eb359946bf07136fd89b3a749cdf0bd79907d0ae4b7fa28d2366d379656d14c8ff1a4cb4ec395a17b1b3a607d2d3d999f5f9')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests -k 'not reverse_readfile_gz and not Path_objects and not zopen and not zpath'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
