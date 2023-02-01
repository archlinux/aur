# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyqt-feedback-flow
pkgname=python-${_base}
pkgver=0.1.6
pkgrel=1
pkgdesc="Show feedbacks in toast-like notifications"
url="https://github.com/firefly-cpp/${_base}"
arch=(any)
license=(MIT)
depends=(python-pyqt5 python-emoji)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('abe48bf6e6367dfc78c8bf5995b6744caaac59fac0d7820a0c067e71080cfc4664824b2a31659e67169b919d242fafde7700f034768c50090c93df67a17a4ac0')

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
  ln -s "${site_packages}/${_base}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
