# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=scikit-fem
pkgname=python-${_base}
pkgdesc="Simple finite element assemblers"
pkgver=5.1.0
pkgrel=3
arch=('x86_64')
url="https://github.com/kinnala/${_base}"
license=('custom:BSD-3-clause')
depends=(python-scipy python-meshio)
makedepends=(python-setuptools python-pip)
checkdepends=(python-pytest python-matplotlib python-pacopy python-pyamg python-h5py)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('d617aa572a5a7d39e3379c22708cf2dbabb66357e769ebe59718cf0858ec357fec46edb938a05ce7bddb0d639b46d5c24a4f299df5f2c47d8a7704e154ab42ca')

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  MPLBACKEND=Agg PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest -k 'not Ex23'
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
