# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=aquarel
pkgname=python-${_base}
pkgdesc="Lightweight templating engine for matplotlib"
pkgver=0.0.7
pkgrel=1
arch=(any)
url="https://github.com/lgienapp/${_base}"
license=(MIT)
depends=(python-matplotlib python-cycler python-seaborn)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('6a1236f72f146925b02d19aca7efe700a9851955fda3586cea871b7646969ab772bee3d341ab4b1af2d01f81675e00354b762b8c081585115246a8ab4cabc154')

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
