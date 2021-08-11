# Maintainer: Shiv Upadhyay <shivnupadhyay@gmail.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=quadpy
pkgname=python-${_base}
pkgver=0.16.8
pkgrel=5
pkgdesc="Numerical integration (quadrature, cubature) in Python"
arch=('any')
url="https://github.com/nschloe/${_base}"
license=('GPL3')
depends=('python-orthopy' 'python-scipy' 'python-ndim')
makedepends=('python-setuptools' 'git-lfs')
checkdepends=('python-tox' 'eigen')
optdepends=('python-matplotlib: for Matplotlib rendering'
  'vtk: for generate polygon data for a sphere')
source=(git+${url}.git#tag=${pkgver})
sha512sums=('SKIP')

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

check() {
  cd "${_base}"
  tox -e py$(python -c "import sys; print(sys.version[:3].replace('.', ''))")
}

package() {
  cd "${_base}"
  export PYTHONHASHSEED=0
  python -c "from setuptools import setup; setup();" install --root="$pkgdir" --optimize=1
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
