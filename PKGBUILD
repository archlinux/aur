# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
_base=snuggs
pkgname=python-${_base}
pkgver=1.4.7
pkgrel=4
pkgdesc="Snuggs are s-expressions for Numpy"
url="https://github.com/mapbox/${_base}"
license=(MIT)
arch=(any)
depends=(python-numpy python-pyparsing)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-hypothesis)
source=(${_base}-${pkgver}::${url}/archive/${pkgver}.tar.gz
  non-strict.patch::${url}/pull/28.patch)
sha512sums=('c1f40e521d1b0cf15075b22b04000c74ecbd0522cdd820b8c159aac812924d877349b3f3bca93b09eed5b025a34c26665a41c7a52a8145419558b115cf8ef361'
  'a804e7d9a7f2d4209c7ef075f3f9144fd380737c90d43fcd9e9138187f125c8b7bd4316c56a7fc4a658b9e3c1398390d05fd606a8cb95842e774c62731405cfa')

prepare() {
  cd ${_base}-${pkgver}
  patch -p1 -i ../non-strict.patch
}

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
