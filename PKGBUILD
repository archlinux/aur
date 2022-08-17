# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=NiaAML
pkgname=python-${_base,,}
pkgver=1.1.10
pkgrel=1
pkgdesc="Python automated machine learning framework"
url="https://github.com/lukapecnik/${_base}"
arch=(any)
license=(MIT)
depends=(python-niapy python-scikit-learn)
makedepends=(python-build python-install python-poetry)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('0ba2ca4c102c913b1f3144360bf18ab6a01274b19332e0520d0c401dd8023924fc16815230822fde270c441c8f66b73cf212f5a88501fdb3b4ad8124c77cad50')

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
