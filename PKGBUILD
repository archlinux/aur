# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>
_base=cplot
pkgname=python-${_base}
pkgdesc="Color maps for complex-valued functions"
pkgver=0.8.3
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-colorio python-matplotx)
makedepends=(python-setuptools)
checkdepends=(python-pytest-codeblocks) # python-mpmath python-scipy python-meshzoo
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('7dedb5fbedf011d34cb40acb8876180c5d1986caacf08bf26148a3e1cdbb15320b3835926984a72a121b2407f06d1fb62032880a8b4b538d966c06d64c3807b5')

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
