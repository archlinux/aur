# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyvoro
pkgname=python-${_base}-mmalahe
pkgdesc="2D and 3D Voronoi tessellations: a python entry point for the voro++ library"
_gitcommit=30645a24c21e1a2a88f88834d15d73de3a6dccf1
pkgver=1.3.3
pkgrel=3
arch=('x86_64')
url="https://github.com/mmalahe/${_base}"
license=('custom')
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel cython git)
source=("git+${url}.git#commit=${_gitcommit}")
sha512sums=('SKIP')

prepare() {
  sed -i 's/-file/_file/' ${_base}/setup.cfg
  cd ${_base}/${_base}
  cython voroplusplus.pyx --cplus
}

build() {
  cd ${_base}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}
  local _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
  PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-${pyversion}/${_base}" python setup.py test
}

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
