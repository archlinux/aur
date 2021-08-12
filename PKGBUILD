# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pygmsh
pkgname=python-${_base}
pkgdesc="Gmsh for Python"
pkgver=7.1.10
pkgrel=2
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-meshio gmsh)
makedepends=(python-setuptools)
checkdepends=(python-pytest-codeblocks) #python-matplotlib python-pytest-randomly
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('91a0fb5e27f4369a42a638e69347a1551c4d8a283162c6e0e534c7e17ae31f3211e98288915a4227476dc5a68f99e2e421a00be1ba53aac3039484db195eb0e3')

export PYTHONPYCACHEPREFIX="${BUILDDIR}/${pkgname}/.cache/cpython/"

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):/usr/share/gmsh/api/python:${PYTHONPATH}" python -m pytest --codeblocks
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  python -c "from setuptools import setup; setup();" install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  echo 'Important note: for the python-gmsh module to be available you need to add export PYTHONPATH="$PYTHONPATH:/usr/share/gmsh/api/python" in ~/.bashrc, ~/.zshrc, etc. :-)'
}
