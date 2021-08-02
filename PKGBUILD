# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=meshzoo
pkgname=python-${_base}
pkgdesc="A collection of meshes for canonical domains"
pkgver=0.7.5
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-numpy)
makedepends=(python-setuptools)
checkdepends=(python-tox)
optdepends=('python-matplotlib: for Matplotlib rendering in 2d')
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('487b99ba581d53c0d591f02a3d871866e283ae47334a2d780c9871d5d12dae709770c3ce8b548abcc8f7f6ec527878c3532a10591b29a892537be34d989c755a')

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd "${_base}-${pkgver}"
  tox -e py$(python -c "import sys; print(sys.version[:3].replace('.', ''))")
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  python -c "from setuptools import setup; setup();" install --root="${pkgdir}" --optimize=1
  rm -r "${pkgdir}$(python -c "import site; print(site.getsitepackages()[0])")/${_base}/__pycache__"
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
