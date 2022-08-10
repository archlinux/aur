# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=NiaAML
pkgname=python-${_base,,}
pkgver=1.1.9
pkgrel=2
pkgdesc="Python automated machine learning framework"
url="https://github.com/lukapecnik/${_base}"
arch=(any)
license=(MIT)
depends=(python-niapy python-scikit-learn)
makedepends=(python-build python-install python-poetry)
checkdepends=(python-pytest)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('cad710dc0a204b8730aace8800bfb62a80898fecb569d5cb9b806c169f59b56f9c064fc654c95b1b9c45effd86073437994f8e7e5c8548b851ae3be95fa2854f')

prepare() {
  sed -i 's/^name = "'"${_base}"'"/name = "'"${_base,,}"'"/' ${_base}-${pkgver}/pyproject.toml
}

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest -k 'not pipeline_run_works_fine'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
