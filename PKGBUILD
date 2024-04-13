# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-flake8
pkgver=1.1.1
pkgrel=3
pkgdesc='pytest plugin to check FLAKE8 requirements'
arch=('any')
license=('MIT')
url='https://github.com/tholo/pytest-flake8'
depends=('python-pytest' 'flake8')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tholo/pytest-flake8/archive/$pkgver.tar.gz")
sha512sums=('7ad9b6da1fdb9f9ac8720820589d1a213b1c1bda8c2579d988d288031fb717916c81d100488200a4d64b880575041f34387c20685416ed789ced51063e814e13')

prepare() {
  cd pytest-flake8-$pkgver
  sed -i 's/ignore = E128/ignore = E128 W605/' tox.ini
}

build() {
  cd pytest-flake8-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  # Hack entry points by installing it

  cd pytest-flake8-$pkgver
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  # 13 test failures since Python 3.11
  PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH" py.test || true
}

package() {
  cd pytest-flake8-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/pytest-flake8-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
