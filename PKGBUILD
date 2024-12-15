# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyqt-feedback-flow
pkgname=python-${_base}
pkgver=0.3.5
pkgrel=1
pkgdesc="Show feedbacks in toast-like notifications"
url="https://github.com/firefly-cpp/${_base}"
arch=(any)
license=(MIT)
depends=(python-pyqt6 python-emoji)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest-qt)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('92815067a24de6499da07e781357444ba3cb796e927f0b03419c43e0035de0b9617f83214b13f6763c6b6a679b83c3659e709a0ec8f674eb3fb2887c7dfc4665')

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
