# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Neil Santos <nsantos16+aur@gmail.com>

_name=pytest-xprocess
pkgname=python38-pytest-xprocess
pkgver=0.20.0
pkgrel=1
pkgdesc='Pytest plugin to manage external processes across test runs.'
arch=(any)
url="https://github.com/pytest-dev/pytest-xprocess"
license=(MIT)
depends=(python38-psutil python38-pytest)
makedepends=(python38-build python38-installer python38-setuptools-scm python38-wheel)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('bce022c924db94f53549c1df5547a8df7390806bb99d817f152f1e5fb946fef60f2447a31dc519577c1b54d6a7adeb7d7d996a28e7784918622db5ccfd0b035b')
b2sums=('8e66ad321224cb8e702721b0936c56b65be5aee9330a233c710519303679f2d1eea03825fe4326ffd2811f6fe4c37db217a2c0c34561742bd2c849ddcae7284e')

build() {
  cd $_name-$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python3.8 -m "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location
  python3.8 -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  # issues with some tests at least since 0.18.1: https://github.com/pytest-dev/pytest-xprocess/issues/95
  pytest -vv -k "not test_interruption_cleanup and not test_interruption_does_not_cleanup"
}

package() {
  cd $_name-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 {CHANGELOG,README}.rst -t "$pkgdir/usr/share/$pkgname/"
}
