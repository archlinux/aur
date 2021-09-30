# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_name=MicroStructPy
_base=microstructpy
pkgname=python-${_base}
pkgdesc="Microstructure modeling, mesh generation, analysis, and visualization"
pkgver=1.5.2
pkgrel=1
arch=('x86_64')
url="https://github.com/kip-hart/${_base}"
license=(MIT)
depends=(python-aabbtree pybind11 python-lsq-ellipse python-matplotlib python-meshpy python-pygmsh python-pyquaternion python-pyvoro-mmalahe python-scipy python-xmltodict)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('016cca96116d8ad3e0b170868412e01ad791c51d6040ae03e21ee944f372f5f17040b970b7241a994ad250114554ae94aa1f9d364467ebb014f122eeab3775c5')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_name}-${pkgver}"
  PYTHONPATH="$PWD/build/lib:/usr/share/gmsh/api/python" python -m pytest tests
}

package() {
  cd "${_name}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
