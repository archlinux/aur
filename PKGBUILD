# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Robert Kubosz <kubosz.robert@gmail.com>
_base=uqbar
pkgname=python-${_base}
pkgver=0.7.4
pkgrel=1
pkgdesc="Tools for building documentation with Sphinx, Graphviz and LaTeX"
arch=(any)
url="https://github.com/josiah-wolf-oberholtzer/${_base}"
license=(MIT)
depends=(python-sphinx python-unidecode python-black)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-cov graphviz)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('af89ebcd341064c0c3724c9241d4f3a51c804b44e75a2711cea8820035668eadcd8dda5f847a8f9acf9859a7b7908f243e7cc4c0f7bf1c8b85b3af0e749d30c2')

prepare() {
  cd ${_base}-${pkgver}
  sed -i '/sphinx_immaterial/d' docs/source/conf.py
}

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
  PYTHONPATH="$PWD" make -C docs man
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "docs/build/man/${_base}.1" -t "${pkgdir}/usr/share/man/man1/"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
