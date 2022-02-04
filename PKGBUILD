# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=adaptmesh
pkgname=python-${_base}
pkgdesc="Adaptive mesh generation and refinement"
pkgver=0.3.3
pkgrel=1
arch=('x86_64')
url="https://github.com/kinnala/${_base}"
license=(MIT)
depends=(python-matplotlib python-scikit-fem)
makedepends=(python-setuptools python-pip)
checkdepends=(python-pytest)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('0fba25cd035178c373d8df5e53459bd50019dac8434d0370e8f79dc8fd5a3886f211b49886fd8bfcd056b588b16f97288f3b889abdb650603c8ede44465216ed')

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
