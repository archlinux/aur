# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>
_base=scipyx
pkgname=python-${_base}
pkgdesc="SciPy fixes and extensions"
pkgver=0.0.18
pkgrel=2
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(BSD)
depends=(python-scipy)
makedepends=(python-setuptools)
checkdepends=(python-pytest-codeblocks)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('91499cf852d3e1a09925f1d6621d16bdd8cf8c78f97e9afdb938f171309aa5898e219a4db222c2e6454c1c659ca62a274c2d4a11d9852857d4e64a5b53c6b23f')

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest --codeblocks
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
