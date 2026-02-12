# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=DeepEcho
pkgname=python-${_base,,}
pkgver=0.8.1
pkgrel=1
pkgdesc="Create sequential synthetic data of mixed types using a GAN"
arch=(x86_64)
url="https://github.com/sdv-dev/${_base}"
license=(BUSL-1.1)
depends=(python-pytorch python-tqdm)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-tomli python-invoke)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('bfecf9f9e6b9c30fb5dcb1d17343b483ba7dc772b9f0c4d576dea6ee023f031ac9f64dec4f2e1781781f1801978503537392b21284d9693a409ebc3f5e858641')

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
