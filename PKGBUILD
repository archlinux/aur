# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: Erin Sheldon
_base=ngmix
pkgname=python-${_base}
pkgver=2.3.0
pkgrel=1
pkgdesc="Gaussian mixtures and image processing"
arch=(any)
url="https://github.com/esheldon/${_base}"
license=(GPL)
depends=(python-numba)
optdepends=('python-galsim: for metacalibration operations'
  'python-scipy: for image fitting using Levenberg-Marquardt fitter'
  'python-scikit-learn: for sampling multivariate PDFs')
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-galsim python-scipy python-fitsio python-flaky python-metadetect) # python-scikit-learn
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
  setup.py.patch)
sha512sums=('176a80955f72b5018bbccfee1ec6dc6857975ecb81cb4092f45bff0a50c644f563317a3e74a27346a91974f900ba51f4fe046eab01d9cfa649a404c148bd39c6'
  'a0464809ec508f67ffb79dec29088ce2b9d7269c739d66d9a47f7251ae31657d33a2fa5ffa80c37bd50b1c04b72418ef16e104b2dd4e165448f357a193b876a0')

prepare() {
  patch -p1 -d ${_base}-${pkgver} <setup.py.patch
  sed -i "s/__version__/$pkgver/" ${_base}-${pkgver}/setup.py
}

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest
# }

package_python-ngmix() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
