# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Eric Berquist <eric dot berquist at gmail dot com>
_base=PyLaTeX
pkgname=python-${_base,,}
pkgver=1.4.2
pkgrel=2
pkgdesc="Python library for creating LaTeX files and snippets"
arch=(any)
url="https://jeltef.github.io/${_base}"
license=(MIT)
depends=(python-ordered-set)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-matplotlib python-quantities texlive-latexextra texlive-fontsrecommended)
optdepends=('python-numpy: for matrices support'
  'python-matplotlib: for plot support'
  'python-quantities: for quantities support')
source=(${_base}-${pkgver}.tar.gz::https://github.com/JelteF/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('c46661c3be63592bcdb575931ebf9bf53855385753cfc6d5f02a004e38924478e3437416717f0499c705f9bab7b75d8fcc2583e153f74c3de07161fb5020e5c5')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
