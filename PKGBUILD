# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=monty
pkgname=python-${_base}
pkgdesc="Monty is the missing complement to Python"
pkgver=2023.5.8
pkgrel=2
arch=(x86_64)
url="https://github.com/materialsvirtuallab/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-bson python-pandas python-pydantic python-ruamel-yaml python-tqdm python-pytorch)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('07c62bbafff0f13434594ea70efceb4cbc3803d4a1ef4feac48c2a057663e459f15421cfcce9c8e4bde10adaec8e02faae033611972dbfd3c9141de371ddd453')

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
