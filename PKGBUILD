# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=matplotx
pkgname=python-${_base}
pkgdesc="Extensions for Matplotlib"
pkgver=0.2.3
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(MIT)
depends=(python-networkx)
makedepends=(python-setuptools)
checkdepends=(python-pytest-codeblocks)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('e4d43fea74ca1a9e27d477c641f2b7310d6acafdff7f57c9a5feeff4f8a6b78e9d1a537f1f9c0650b99347ed5bc4bad4d952c3b62f6f8d89bb0e597f16c572ed')

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
