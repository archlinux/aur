# Maintainer: Shiv Upadhyay <shivnupadhyay@gmail.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=quadpy
pkgname=python-${_base}
pkgver=0.16.10
pkgrel=1
pkgdesc="Numerical integration (quadrature, cubature) in Python"
arch=('any')
url="https://github.com/nschloe/${_base}"
license=('GPL3')
depends=('python-orthopy' 'python-scipy' 'python-ndim')
makedepends=('python-setuptools' 'git-lfs')
# checkdepends=('python-accupy' 'python-matplotlib' 'python-pytest-codeblocks' 'eigen' 'qt5-x11extras')
optdepends=('python-matplotlib: for Matplotlib rendering'
  'vtk: for generate polygon data for a sphere')
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
#   MPLBACKEND=Agg PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest --codeblocks
# }

package() {
  cd "${_base}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --root="$pkgdir" --optimize=1
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
