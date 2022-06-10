# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=nbQA
pkgname=${_base,,}
pkgdesc="Run any standard Python code quality tool on a Jupyter Notebook"
pkgver=1.3.1
pkgrel=2
arch=(any)
url="https://github.com/${_base}-dev/${_base}"
license=(MIT)
depends=(ipython python-tokenize-rt python-tomli)
makedepends=(python-setuptools)
checkdepends=(python-pytest yapf python-pydocstyle python-isort autopep8 flake8 mypy python-black python-autoflake mdformat pyupgrade blacken-docs python-pylint)
optdepends=('python-black: toolchain support'
  'flake8: toolchain support'
  'python-isort: toolchain support'
  'mypy: toolchain support'
  'python-pylint: toolchain support'
  'pyupgrade: toolchain support')
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('907641d061685c82ae9897151e7a04014a5e3ab5f203cb2911befa85dde2b9a273d73c02c01ce6a617137870f0c4b845c11076843f1a10bf51eb5967d3550f0e')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest tests -k 'not diff_present and not return_code and not version and not black and not pylint_works'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
