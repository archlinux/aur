# Contributor: redponike <proton (dot) me>
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: Achmad Fathoni<fathoni.id(at)gmail.com>

pkgname=python-beartype
_pkgname=${pkgname#python-}
pkgver=0.22.9
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
sha256sums=('ecc0518c0c9102637e711c8f46ce0ba561c3138c89aea522d4b28b84a5f47b2d')

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
