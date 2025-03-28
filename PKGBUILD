# Maintainer: redponike <proton (dot) me>
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: Achmad Fathoni<fathoni.id(at)gmail.com>

pkgname=python-beartype
_pkgname=${pkgname#python-}
pkgver=0.20.2
pkgrel=1
pkgdesc="Unbearably fast near-real-time hybrid runtime-static type-checking in pure Python"
arch=('any')
url="https://github.com/beartype/beartype"
license=('MIT')
depends=('python>=3.9')
makedepends=(
  python-build
  python-hatchling
  python-installer
  python-wheel
)
checkdepends=(
  python-pytest
  python-numpy
  python-xarray
  python-click
  python-rich-click
  python-pygments
  python-typing_extensions
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d06c10e442c4e4e84f080ba7f41ddac1b46d7d8e4d7f80bb95f6075a06ff61fe')

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
  pytest --deselect beartype_test/a90_func/pep/test_pep561_static.py -p asyncio
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
