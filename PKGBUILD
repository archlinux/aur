# Mantainer: Jose Riha <jose1711 gmail com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>

_base=cheap_repr
pkgname=python-${_base}
pkgdesc="Better version of repr/reprlib for short, cheap string representations"
pkgver=0.5.2
pkgrel=1
arch=(any)
url="http://github.com/alexmojaki/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest python-django)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('e1b1d2cade37fc70ac7d8bb96ad030001328abf6fb3b187763495baee3fc62fa24bae82caa0fd6321b07efa8960f0fcfad42e59a8eccba933d7a6c2bbe36d67f')

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
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
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
