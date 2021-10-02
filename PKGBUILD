# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=adaptmesh
pkgname=python-${_base}
pkgdesc="Adaptive mesh generation and refinement"
pkgver=0.3.2
pkgrel=1
arch=('x86_64')
url="https://github.com/kinnala/${_base}"
license=(MIT)
depends=(python-matplotlib python-scikit-fem)
makedepends=(python-setuptools python-pip)
checkdepends=(python-pytest)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('6fc91778dcaadce5060abbf16e329256c701efa93318c0a2c0ff15251bfce6119695d7de48a9b9c328efd540e5e5101cc5fd16228f845870394f33fec2246457')

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  MPLBACKEND=Agg PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):/usr/share/gmsh/api/python:${PYTHONPATH}" python -m pytest
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
