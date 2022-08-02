# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-shell-utilities
pkgname=python-pytest-shell-utilities
pkgver=1.6.0
pkgrel=1
pkgdesc="Pytest plugin providing fixtures and code to help with running shell commands on tests"
arch=(any)
url="https://github.com/saltstack/pytest-shell-utilities"
license=(Apache)
depends=(python python-attrs python-pytest python-pytest-helpers-namespace python-pytest-skip-markers python-psutil python-typing-extensions)
makedepends=(python-build python-installer python-setuptools python-setuptools-declarative-requirements python-setuptools-scm python-toml python-wheel)
checkdepends=(python-pytest-subtests)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('9a2e04404d2243348080c3d12588e8fef002f6c96e406784c19dc01d1c8cd477')
b2sums=('666253d51cbc5d1e3622ceb6130497d0dac130c686cb0b0c6f411125c00e26d303c042b0f1d5c469528f442ac725d80857ecd21442aa580c68b11702e21add69')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGELOG,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
