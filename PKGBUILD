# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=NiaAML
pkgname=python-${_base,,}
pkgver=1.1.8
pkgrel=1
pkgdesc="Python automated machine learning framework"
url="https://github.com/lukapecnik/${_base}"
arch=(any)
license=(MIT)
depends=(python-niapy python-scikit-learn)
makedepends=(python-build python-install python-poetry)
checkdepends=(python-pytest)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('6d0b092b0c994d8b704bb3f4868966d0ed2a80f2b8fb6b95906e1dfa99e70670b0bfd47eac2305ace93171c52e4026779cc9277ed30413ecd7229fd7c827ba1c')

prepare() {
  sed -i 's/^name = "'"${_base}"'"/name = "'"${_base,,}"'"/' ${_base}-${pkgver}/pyproject.toml
}

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
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
