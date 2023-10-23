# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Eric Berquist <eric dot berquist at gmail dot com>
_base=PyLaTeX
pkgname=python-${_base,,}
pkgver=1.4.2
pkgrel=1
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
sha512sums=('dcbe58de0ab715d6fbb571a7ad3981c875eacd08d06244b8715fa240df6f8f072417ae076a5caee204e000bf7eb55097b9ba49eddb5ce666470e494c15aa88ed')

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
