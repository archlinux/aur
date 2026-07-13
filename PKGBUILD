# Maintainer: Darkfish Tech <arch at darkfish dot com dot au>

_pyname=escapism
pkgname="python-${_pyname}"
pkgdesc="A library for escaping and unescaping strings"
pkgver=1.1.0
pkgrel=1
url="https://github.com/jupyterhub/escapism"
arch=('any')
license=('BSD-3-Clause')

makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
)
checkdepends=(
  'python-codecov'
  'python-pytest'
  'python-pytest-cov'
)

source=("${_pyname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
b2sums=('fddb900095aee1a26078cb80745151b3145f724e0858c86c61e808eee1fc6bd615d8cf76c3aef182d7f395c4d438c5307ad07153961e4c160ed63204035a2dfe')

build() {
  cd "$_pyname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pyname-$pkgver"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/$_pyname-$pkgver"-*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd "$_pyname-$pkgver"

  python -m installer --destdir="$pkgdir" "dist/$_pyname-$pkgver"-*.whl
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Don't package the unit tests. There are no tests in the python wheel.
  #rm -rf "$pkgdir/"usr/lib/python*/site-packages/escapism/tests
}
