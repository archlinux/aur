# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>
_base=meshzoo
pkgname=python-${_base}
pkgdesc="A collection of meshes for canonical domains"
pkgver=0.9.0
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-numpy)
makedepends=(python-setuptools)
checkdepends=(python-pytest-codeblocks python-matplotlib python-pytest-randomly)
optdepends=('python-matplotlib: for Matplotlib rendering in 2d')
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('abcd1e852ed644f24d5a443fb1fd352b429228f7c8eba2c817383308253fdaf2ab3b8dbd73be96e8114e924ee41f666d6c6969d93aa98500c939a8428c3ca4e8')

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
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
