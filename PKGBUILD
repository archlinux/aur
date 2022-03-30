# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=MicroStructPy
pkgname=python-${_base,,}
pkgdesc="Microstructure modeling, mesh generation, analysis, and visualization"
pkgver=1.5.3
pkgrel=1
arch=('x86_64')
url="https://github.com/kip-hart/${_base}"
license=(MIT)
depends=(python-aabbtree pybind11 python-lsq-ellipse python-matplotlib python-meshpy python-pygmsh python-pyquaternion python-pyvoro-mmalahe python-scipy python-xmltodict)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('556c39ae7eb5d9d738f9a884905d996700634740951a3aea7fffb980ddc85fb2c567ffaadc4e58bfdfaafd98f365d11fc327348a6592f9779c74cc14ebb8c3c8')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  PYTHONPATH="$PWD/build/lib:/usr/share/gmsh/api/python" python -m pytest tests
}

package() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
