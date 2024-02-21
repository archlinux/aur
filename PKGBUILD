# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_base=persim
pkgname=python-${_base}
pkgver=0.3.3
pkgrel=1
pkgdesc="Distances and representations of persistence diagrams"
arch=(any)
url="https://github.com/scikit-tda/${_base}"
license=(MIT)
depends=(python-scikit-learn python-matplotlib python-hopcroftkarp python-deprecated)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('32e1e09ef6fab2adcb24e945dbaa50385ee760b82af487aba2a1181fb3c192bec969a9af8ebecb507be006b2691d60b71d2669876596981856b4f0eff3ad76a0')

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
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
