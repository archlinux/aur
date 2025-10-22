# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-blackdoc
_pypi=blackdoc
pkgdesc='Run Black on documentation code snippets'
pkgver=0.4.5
pkgrel=1
url='https://github.com/keewis/blackdoc'
license=('MIT')
arch=('any')

depends=(
  'python-black'
  'python-more-itertools'
  'python-pathspec'
  'python-rich'
  'python-tomli'
)
optdepends=(
  'ipython: for working with .ipynb files'
  'python-tokenize-rt: for working with .ipynb files'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)

source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '9da6a59f2005e1fbbe6ac651c3f283a398dada67e11e8c573be33dca789d8cfa'
)

build() {
  cd "$_pypi-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pypi-$pkgver"
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/"blackdoc-$pkgver"*.whl
  test-env/bin/python -m pytest
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" dist/"blackdoc-$pkgver"*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rf "$pkgdir/$site_packages/blackdoc/tests"
}
