# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=arm-preprocessing
pkgname=python-${_base}
pkgver=0.2.5
pkgrel=1
pkgdesc="Implementation of several preprocessing techniques for Association Rule Mining"
url="https://github.com/firefly-cpp/${_base}"
arch=(any)
license=(MIT)
depends=(python-niaarm python-scikit-learn)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest python-sport-activities-features)
optdepends=(python-sport-activities-features)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('d3566444a316561893ed3fa5fba0822cf296f57b7f4737973b7f50b6eeb4d85ae28b33f3662d2cb7e4fe82f23f73ed5e24ad14b2d28deb3e0986bdf9ba213f8b')

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
