# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>
_base=cplot
pkgname=python-${_base}
pkgdesc="Color maps for complex-valued functions"
pkgver=0.7.3
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-colorio python-mplx)
makedepends=(python-setuptools)
checkdepends=(python-pytest-codeblocks) # python-mpmath python-scipy python-meshzoo
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('3fe6ac1fdaa912c500a428b91ee1d5247bb5ce9765528dfcee041b6eed51ffe8e90194d6a1d3b424e9ac723e8ea75acff131d8f84b14461285ed40b213043e2f')

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  MPLBACKEND=Agg PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest --codeblocks
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
