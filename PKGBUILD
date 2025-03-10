# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: Erin Sheldon
_base=ngmix
pkgname=python-${_base}
pkgver=2.3.2
pkgrel=1
pkgdesc="Gaussian mixtures and image processing"
arch=(any)
url="https://github.com/esheldon/${_base}"
license=(GPL)
depends=(python-numba python-scipy)
optdepends=('python-galsim: for metacalibration operations'
  'python-scikit-learn: for sampling multivariate PDFs')
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-galsim python-fitsio python-flaky python-metadetect) # python-scikit-learn
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
  setup.py.patch)
sha512sums=('185d51a58195da77e8ab645025dee4da80a31dcf10315ca4cfa8f43218cab505f89f7367837b73ba2ea5ad0954bd2a4a45837e9feb73ab3be98bab48bb58a2c1'
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
