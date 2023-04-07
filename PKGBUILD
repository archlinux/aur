# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-shell-utilities
pkgname=python-pytest-shell-utilities
pkgver=1.7.0
pkgrel=2
pkgdesc="Pytest plugin providing fixtures and code to help with running shell commands on tests"
arch=(any)
url="https://github.com/saltstack/pytest-shell-utilities"
license=(Apache)
depends=(python python-attrs python-pytest python-pytest-helpers-namespace python-pytest-skip-markers python-psutil python-typing-extensions)
makedepends=(python-build python-installer python-setuptools python-setuptools-declarative-requirements python-setuptools-scm python-toml python-wheel)
checkdepends=(python-pytest-subtests)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('98a78d7a9c5385e066f04bbfeb5df1b43d76d9d3d45749c4267385f58b99f751')
b2sums=('bb3760f626857bca6eac3c27132416db882becfb5da551cab19d513d700367943697e0ffb980b4189bb7965d0f082f3fcee408ea6bb18e156d87cfc36c5c130a')

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
