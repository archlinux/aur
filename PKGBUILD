# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=mplx
pkgname=python-${_base}
pkgdesc="Extensions for Matplotlib"
pkgver=0.1.0
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(MIT)
depends=(python-networkx)
makedepends=(python-setuptools)
checkdepends=(python-pytest-codeblocks)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('ef943b2d139a8ccfe657f0ad1e2ed98e8f988a7cbe6a4be15956e938e1d4fba8b8287fbf5d6034a974f9284013f61a2ed6a3d5bd51b7beed9d403593dcb14e4d')

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
