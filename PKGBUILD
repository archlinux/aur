# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pypiname="pyriemann"
pkgname="python-${_pypiname}"
pkgver=0.12
pkgrel=1
pkgdesc="Machine learning for multivariate data through the Riemannian geometry of positive definite matrices in Python"
arch=(
  'any'
)
url="https://pyriemann.readthedocs.org"
_url="https://github.com/pyRiemann/pyRiemann"
license=(
  'BSD-3-Clause'
)
depends=(
  'python>=3.9'
  'python-numpy>=1.25.0'
  'python-scipy'
  'python-scikit-learn>=0.24'
  'python-array-api-compat>=1.11'
  'python-array-api-extra>=0.6'
  'python-joblib'
  'python-matplotlib'
)
checkdepends=(
  'python-pytest'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
)
optdepends=(
  'python-pytorch: PyTorch tensors'
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "python-${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('487ce591454ad82f3b2fcbf7f54d44efd3669f08dfef895f7b365b921071679b')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -P -m pytest
# }

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${_pypiname//-/_}-${pkgver}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
