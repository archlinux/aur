# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=NiaARM
pkgname=python-${_base,,}
pkgver=0.4.0
pkgrel=1
pkgdesc="A minimalistic framework for numerical association rule mining"
url="https://github.com/firefly-cpp/${_base}"
arch=(any)
license=(MIT)
depends=(python-niapy python-nltk python-plotly python-scikit-learn)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('c8e5aa4c1d0bddee79b7c64f4edace6cfee429ac80952eace0d4ae46ed0e10a19c6afa9aa9568079dd2aa786189b68ba65cd4a01c8dbbc21aeaa34a5c511c12b')

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
  install -Dm 644 ${_base,,}.1 -t "${pkgdir}/usr/share/man/man1/"

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base,,}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
