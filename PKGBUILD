# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=DeepEcho
pkgname=python-${_base,,}
pkgver=0.7.0
pkgrel=1
pkgdesc="Create sequential synthetic data of mixed types using a GAN"
arch=(x86_64)
url="https://github.com/sdv-dev/${_base}"
license=(BUSL-1.1)
depends=(python-pytorch python-tqdm)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-tomli python-invoke)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('628bb1eabbb7bf70c0e1899f4da66473442888f50200aa9fb2238553b6dac702fc19e28123938b491b528b6bf861bf2c374a3abb3d8c24b9f91ebc46597ffb92')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
