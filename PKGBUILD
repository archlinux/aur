# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pygmsh
pkgname=python-${_base}
pkgdesc="Gmsh for Python"
pkgver=7.1.11
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-meshio gmsh)
makedepends=(python-setuptools python-pip)
checkdepends=(python-pytest-codeblocks) #python-matplotlib
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('ee08578a9198e1725baaba55f13e052ef6ddf523bde5040c052837df72d57ab9ef9aa6b3fbba2ba649a222175f2504edf21427a6b6707ad3e28e8bca113976ce')

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
