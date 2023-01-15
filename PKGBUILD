# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ashwin <ashwinvis+arch_@t_Pr0t0nM4il_c0m>
_base=transonic
pkgname=python-${_base}
pkgver=0.5.2.post0
pkgrel=1
pkgdesc="Make your Python code fly at transonic speeds!"
arch=(any)
url="https://foss.heptapod.net/fluiddyn/${_base}"
license=('custom:BSD-3-clause')
depends=(python-beniget autopep8 python-numpy)
optdepends=(
  'python-pythran: compiler backend'
  'python-numba: compiler backend'
  'cython: compiler backend'
  'python-rich: colourful logs'
)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
provides=(${_base})
source=(${_base}-${pkgver}.tar.gz::${url}/-/archive/${pkgver}/${_base}-${pkgver}.tar.gz)
sha512sums=('51c573c89b1d6ad0976f18908d32bbc1ce50679062542e48dba9165a1294646738b3c18821910c35c3e33f1f34e6e5a3f7905b87eccc1db369ee2c74c5560d17')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python setup.py install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest tests -k 'not justintime and not init'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
