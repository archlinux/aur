# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyfvm
pkgname=python-${_base}
pkgdesc="Finite volume discretization tools for Python"
pkgver=0.3.7
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-meshplex python-npx python-scipy python-sphinxcontrib-bibtex python-sympy)
makedepends=(python-setuptools git-lfs)
# checkdepends=(python-pytest-codeblocks python-matplotlib python-pyamg python-pykry python-meshzoo) # python-netcdf4
source=(git+${url}.git#tag=v${pkgver})
sha512sums=('SKIP')

export GIT_LFS_SKIP_SMUDGE=1

prepare() {
  cd "${_base}"
  git remote set-url origin "${url}.git"
  git lfs install
  git lfs fetch
  git lfs checkout
}

build() {
  cd "${_base}"
  python -c "from setuptools import setup; setup();" build
}

# check() {
#   cd "${_base}"
#   python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
#   MPLBACKEND=Agg PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}"
#   python -m pytest --codeblocks test
#   PYTHONPATH="$PWD/build/lib/${_base}/" python -m pytest --codeblocks
# }

package() {
  cd "${_base}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
