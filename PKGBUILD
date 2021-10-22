# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pygmsh
pkgname=python-${_base}
pkgdesc="Gmsh for Python"
pkgver=7.1.13
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-meshio gmsh)
makedepends=(python-setuptools python-pip)
checkdepends=(python-pytest-codeblocks) # python-matplotlib
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('89842156b1e8faed3cd3805a3c6ae8d34b3704420fb552f9cf8f8b596a05a424823b95954a9798f551803b6e6936948308e8faab2c8bde01a010993341346af9')

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):/usr/share/gmsh/api/python:${PYTHONPATH}" python -m pytest --codeblocks # MPLBACKEND=Agg
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  echo 'Important note: for the python-gmsh module to be available you need to add export PYTHONPATH="$PYTHONPATH:/usr/share/gmsh/api/python" in ~/.bashrc, ~/.zshrc, etc. :-)'
}
