# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=meshzoo
pkgname=python-${_base}
pkgdesc="A collection of meshes for canonical domains"
pkgver=0.7.5
pkgrel=2
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-numpy)
makedepends=(python-setuptools)
checkdepends=(python-pytest-codeblocks python-matplotlib)
optdepends=('python-matplotlib: for Matplotlib rendering in 2d')
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('487b99ba581d53c0d591f02a3d871866e283ae47334a2d780c9871d5d12dae709770c3ce8b548abcc8f7f6ec527878c3532a10591b29a892537be34d989c755a')

export PYTHONPYCACHEPREFIX="${BUILDDIR}/${pkgname}/.cache/cpython/"

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
  python -c "from setuptools import setup; setup();" install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
