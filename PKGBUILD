# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=scikit-fem
pkgname=python-${_base}
pkgdesc="Simple finite element assemblers"
pkgver=4.0.0
pkgrel=1
arch=('x86_64')
url="https://github.com/kinnala/${_base}"
license=('custom:BSD-3-clause')
depends=(python-scipy python-meshio)
makedepends=(python-setuptools python-pip)
checkdepends=(python-pytest python-matplotlib python-pacopy python-pyamg)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('6ec180b5324ccaed26af2714a013cded02c2c65c505acd422a9728e4a02f570f514e6813f1d25e660d9887c13b61ad818cc9c46bcd532077f3ff388e47dd53ef')

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  MPLBACKEND=Agg PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
