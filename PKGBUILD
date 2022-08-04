# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_name=Amulet-NBT
pkgname=python-${_name,,}
pkgver=2.0.1
pkgrel=1
pkgdesc='A Python and Cython library for reading and writing binary NBT and stringified NBT'
arch=('x86_64')
url="https://github.com/Amulet-Team/$_name"
license=('unknown')
depends=('python' 'python-mutf8' 'python-numpy')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-versioneer-518' 'python-wheel')
# tests directory isn't in pypi sdist
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('9370a1739eb9fac5ba012dd23052c39435d001eaa2049442d98e76e658246d04')

prepare() {
  cd "$_name-$pkgver"

  # ignore cython version requirement
  sed -Ei 's/(cython) >= 3\.0\.0a9/\1/' pyproject.toml
}

build() {
  cd "$_name-$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"

  # based on https://github.com/archlinux/svntogit-packages/commit/1007750f9a884f04ae7faf085f3ecb9dbe70b5b9
  # install to temporary location
  python -m installer --destdir=test_dir dist/*.whl
  # test_dir needs to be before script directory
  python -c 'import site, sys; sys.path.insert(0, "test_dir/" + site.getsitepackages()[0]); from unittest import __main__' discover -s tests
}

package() {
  cd "$_name-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
