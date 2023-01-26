# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=krypy
pkgname=python-${_base}
pkgdesc="Krylov subspace methods package for Python"
pkgver=2.2.0
pkgrel=3
arch=('x86_64')
url="https://github.com/andrenarchy/${_base}"
license=(MIT)
depends=(python-scipy)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('577d4fcdcc892b5989129ce6f490267fb162c89662955465ed981abab5df9ba3ae3dbdf0197a90f500c472d75a78ffb507412303dc2acc848a7ab463d5a14aac')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python setup.py install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  # https://github.com/andrenarchy/krypy/issues/83
  PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest --ignore=krypy/tests/test_deflation.py --ignore=krypy/tests/test_linsys.py --ignore=krypy/tests/test_recycling.py --ignore=krypy/tests/test_utils.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
