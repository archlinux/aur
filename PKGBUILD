# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-shell-utilities
pkgname=python-pytest-shell-utilities
pkgver=1.8.0
pkgrel=1
pkgdesc="Pytest plugin providing fixtures and code to help with running shell commands on tests"
arch=(any)
url="https://github.com/saltstack/pytest-shell-utilities"
license=(Apache)
depends=(
  python
  python-attrs
  python-pytest
  python-pytest-helpers-namespace
  python-pytest-skip-markers
  python-psutil
  python-typing-extensions
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-declarative-requirements
  python-setuptools-scm
  python-toml
  python-wheel
)
checkdepends=(python-pytest-subtests)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('7f9a1aac43fad962da11e0ba1ae771eb3b84b73fc4bee94a8f563159231e1920')
b2sums=('240104a95deefddc68f4c563d52184a0a9068b28748beadf7dbe25ade31d9cc8745bf535d05d8df0165fa28ab9f0313fb37fd6cd4ca09db8709e6b9a27264089')

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
