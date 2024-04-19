# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>

pkgname=python-beartype
_pkgname=${pkgname#python-}
pkgver=0.18.4
pkgrel=1
pkgdesc="Unbearably fast near-real-time hybrid runtime-static type-checking in pure Python"
arch=(any)
url="https://github.com/beartype/beartype"
license=(MIT)
depends=(
  python
  python-numpy
  python-typing-extensions
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  mypy
  pyright
  python-nptyping
  python-pytest
  python-sphinx
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('090610a7acc9691973af10b8f8b1ce526d4f10def432a9b48a169668291c3930')

_archive="$_pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  rm -rf tmp_install
  python -m installer --destdir=tmp_install dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH"
  pytest
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
