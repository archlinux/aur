# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Daniel Moch <daniel AT danielmoch DOT com>
_base=pytest-flakes
pkgname=python-${_base}
pkgver=4.0.4
pkgrel=1
pkgdesc="pytest plugin to check source code with pyflakes"
arch=('any')
url="https://github.com/asmeurer/${_base}"
license=(MIT)
depends=(python-pytest python-pyflakes)
makedepends=(python-setuptools)
checkdepends=(python-coverage python-pytest-pep8)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('f3bc82bef2dad4a1bf145179f1d25330adcb123cb6e2dd9802b0696be56ef66a8c705725a4e05a9fbbdc37d7482af7fe615735e0e94055f66b0893cc4cf15e53')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_base}-${pkgver}"
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python setup.py install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  PYTHONPATH="$PWD/tmp_install/$site_packages" py.test
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
