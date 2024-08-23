# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>

pkgname=python-beartype
_pkgname=${pkgname#python-}
pkgver=0.18.5
pkgrel=3
pkgdesc="Unbearably fast near-real-time hybrid runtime-static type-checking in pure Python"
arch=(any)
url="https://github.com/beartype/beartype"
license=(MIT)
depends=(
  python
  python-numpy
  python-typing_extensions
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-nptyping
  python-pytest
  python-sphinx
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4507703930622b3b6814d12f95385461438c193d12c83fedcbd83e5904d485ee')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  rm -rf tmp_install
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  pytest --deselect beartype_test/a90_func/pep/test_pep561_static.py
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
