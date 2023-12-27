# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyqt-feedback-flow
pkgname=python-${_base}
pkgver=0.3.3
pkgrel=1
pkgdesc="Show feedbacks in toast-like notifications"
url="https://github.com/firefly-cpp/${_base}"
arch=(any)
license=(MIT)
depends=(python-pyqt6 python-emoji)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('1d6dd50340768526f20c15938e87396ea5789f77c726fd1731fe472f72674a245360a72a6e0532a7e7f223eb6238d6e0696a73f9711d1e36d48ec8d8e111bfc7')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base//-/_}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 
}
