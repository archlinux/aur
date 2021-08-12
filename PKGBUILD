# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=accupy
pkgname=python-${_base}
pkgdesc="Accurate sums and dot products for Python"
pkgver=0.3.4
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-mpmath python-pyfma eigen)
makedepends=(python-setuptools pybind11)
checkdepends=(python-pytest-cov python-perfplot)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('ae1b3b8d3291e8f3322bf20075790e6bc7855ab06275427b954f8958939da83b6216d1ac875259b7ae256cdf190693567c828abf6588f9849aec8f0eaf280316')

export PYTHONPYCACHEPREFIX="${BUILDDIR}/${pkgname}/.cache/cpython/"

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_base}-${pkgver}"
  python setup.py install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
