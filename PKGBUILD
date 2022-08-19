# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Excitable Snowball <excitablesnowball@gmail.com>
_base=sphinxcontrib-katex
pkgname=python-${_base}
pkgver=0.9.0
pkgrel=1
pkgdesc="A Sphinx extension for rendering math in HTML pages"
arch=(any)
url="https://github.com/hagenw/${_base}"
license=(MIT)
depends=(python-sphinx)
makedepends=(python-setuptools)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('f8add5cb639bd177cf0ff5acc24659190dbfa16cd7f7ea6faee049ffdd2119fd38646183190a557dec3310ece0ec9b9fbe997a0ea066dc49776831471ba51ec3')

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
