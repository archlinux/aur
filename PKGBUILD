# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PINA
pkgname=python-${_base,,}-mathlab
pkgver=0.2.6
pkgrel=1
pkgdesc="Physics-Informed Neural networks for Advanced modeling"
url="https://github.com/mathLab/${_base}"
arch=(any)
license=(MIT)
depends=(python-pytorch-lightning)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('209fa0ddc5fb8c0346e3586cf57478a543164036f51e77479dfaa3e882dac2047fb082f50224d1eecb3f3066bdb91be0eed0a48923bc038c4c2466979154eaae')

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
  install -Dm 644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
