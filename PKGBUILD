# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=DeepEcho
pkgname=python-${_base,,}
pkgver=0.8.0
pkgrel=1
pkgdesc="Create sequential synthetic data of mixed types using a GAN"
arch=(x86_64)
url="https://github.com/sdv-dev/${_base}"
license=(BUSL-1.1)
depends=(python-pytorch python-tqdm)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-tomli python-invoke)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('4f97e361d74b30a60123bc7e94ad600788f8b6419508ce7e1521973ff50556bd4352ecc0f589762ed2251a75f61aacb43d12fb2ac4dd0f7a98111aca38e8cabe')

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
