# Maintainer: Felix Yan <felixonmars@archlinux.org>

_name=pytest-pylint
pkgname=python-pytest-pylint
pkgver=0.20.0
pkgrel=1
pkgdesc='pytest plugin to check source code with pylint'
arch=('any')
license=('MIT')
url='https://github.com/carsongee/pytest-pylint'
depends=('python-pytest' 'python-pylint' 'python-toml')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/carsongee/pytest-pylint/archive/v$pkgver.tar.gz")
sha512sums=('c6f30ba62cdc0fde5f4598d3c547c8bc3aed8122f22255fa65fdce4d64466bbbf3f077623cd306a684eea405e38e7c65d3009b8ddf0187c680fc74dda2a8bebb')

prepare() {
  # pytest-runner is certainly not required to build a wheel...
  sed -e '/pytest-runner/d' -i $_name-$pkgver/setup.py
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
  pytest -vv --ignore test_dir/
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
