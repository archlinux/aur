# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=arm-preprocessing
pkgname=python-${_base}
pkgver=0.2.3
pkgrel=1
pkgdesc="Implementation of several preprocessing techniques for Association Rule Mining"
url="https://github.com/firefly-cpp/${_base}"
arch=(any)
license=(MIT)
depends=(python-niaarm python-sport-activities-features python-scikit-learn)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('ee27ec56d3a4e934e98b1bdbd07bc8523a35de049f4d1d2242ea4662d31a2618b78b850cd3529036537a956266337c5f5d1db4e3d5812bd5b54e2e06f39c4817')

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
  ln -s "${site_packages}/${_base/-/_}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
