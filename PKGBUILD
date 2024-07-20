# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_base=persim
pkgname=python-${_base}
pkgver=0.3.7
pkgrel=1
pkgdesc="Distances and representations of persistence diagrams"
arch=(any)
url="https://github.com/scikit-tda/${_base}"
license=(MIT)
depends=(python-scikit-learn python-matplotlib python-hopcroftkarp python-deprecated)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('98daf96bdebc5650f6b3281c5bde37a819664f8902e08e85dcd3d34056a8ef10c29a1e1d81acb3a5cb6dada3393f775ddce416b91cf939dde1cb09728cc2f709')

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
