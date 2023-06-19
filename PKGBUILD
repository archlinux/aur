# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Eric Berquist <eric dot berquist at gmail dot com>
_base=PyLaTeX
pkgname=python-${_base,,}
pkgver=1.4.1
pkgrel=2
pkgdesc="Python library for creating LaTeX files"
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
sha512sums=('55a5734e4d239cef4bcaafa0ba64eea013ba3e86d137de5a5f8311d70c949d783e2e7aad24d39d16a6febbe4bddc34e47248068e1328fe3f95f39a7c7019a3a9')

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
}
