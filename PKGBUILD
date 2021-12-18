# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=meshzoo
pkgname=python-${_base}
pkgdesc="A collection of meshes for canonical domains"
pkgver=0.9.2
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-numpy)
makedepends=(python-setuptools)
checkdepends=(python-pytest-codeblocks python-matplotlib)
optdepends=('python-matplotlib: for Matplotlib rendering in 2d')
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('771fe9dc966d938f04d6a079611257cb3e5025a2e66bb7b089bf97505be6093993d4df00b5964b1a1f663c473f1ecfcf42f95d532390bc62a369924fbf2703ef')

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
