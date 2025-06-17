# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=daft-pgm
pkgname=python-${_base}
pkgver=0.1.4
pkgrel=1
pkgdesc="Render probabilistic graphical models using matplotlib"
arch=(any)
url="https://github.com/daft-dev/${_base}"
license=(BSD-3-Clause)
depends=(python-matplotlib)
makedepends=(python-build python-installer python-setuptools-scm python-wheel python-myst-nb)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base/-/_}-${pkgver}.tar.gz)
sha512sums=('9917cf7025bd41854894ef8c5ae2226e3640631443393cb897743f766ec4531f56c5c9c0feb7239440b86f5b30dc42a1cecb9296ff6b48648ac01f71f64b3ffd')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
  PYTHONPATH="${PWD}" make -C docs man
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest --ignore=test/test_examples.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 docs/_build/man/${_base}.1 -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
