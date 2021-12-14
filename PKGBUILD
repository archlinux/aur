# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Daniel Moch <daniel AT danielmoch DOT com>
_base=pytest-flakes
pkgname=python-${_base}
pkgver=4.0.5
pkgrel=2
pkgdesc="pytest plugin to check source code with pyflakes"
arch=('any')
url="https://github.com/asmeurer/${_base}"
license=(MIT)
depends=(python-pytest python-pyflakes)
makedepends=(python-setuptools)
checkdepends=(python-pytest-pep8)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('5ddcb1dff38c9b0118e4bab7718932da001deabeff8c62a259c3b15832d7f76cb77e1576aa5679a87ed203b2db68e0e45d7e641d2b7fff731069931ac752ceef')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_base}-${pkgver}"
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python setup.py install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  PYTHONPATH="${PWD}/tmp_install/${site_packages}" py.test
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
