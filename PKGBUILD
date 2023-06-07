# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Excitable Snowball <excitablesnowball@gmail.com>
_base=sphinxcontrib-katex
pkgname=python-${_base}
pkgver=0.9.5
pkgrel=1
pkgdesc="A Sphinx extension for rendering math in HTML pages"
arch=(any)
url="https://github.com/hagenw/${_base}"
license=(MIT)
depends=(python-sphinx)
makedepends=(python-setuptools)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d473d943b9beb0ba5286fc928ba69878483ec5130c638735fb26725370e049255d517d59ba895062a99b43993da82132c07f381473ce4e482c8fff7e0e8691ec')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
  # https://github.com/hagenw/sphinxcontrib-katex/issues/86
  rm -r build/lib/docs
}

check() {
  cd ${_base}-${pkgver}
  python -m sphinx docs docs/_build/ -c docs/ -b html -W
  python -m sphinx docs docs/_build/ -c docs/ -b latex -W
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
