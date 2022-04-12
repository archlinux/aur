# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyqt-feedback-flow
pkgname=python-${_base}
pkgver=0.1.5
pkgrel=1
pkgdesc="Show feedbacks in toast-like notifications"
url="https://github.com/firefly-cpp/${_base}"
arch=(any)
license=(MIT)
depends=(python-pyqt5 python-emoji)
makedepends=(python-build python-install python-poetry-core)
checkdepends=(python-pytest)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('409858a57f9779e9bb71d7be79f04c23a41dd47d2e4abd672917ed9b8513b3455a73b3abc260ef6d8725d769ed334a56a6ddd67e2967fd34ccc82cd0879a2627')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
