# Maintainer: Anton Kudelin <kudelin at proton dot me>

_pyname=nmrglue
pkgname=python-$_pyname
pkgver=0.11
pkgrel=1
pkgdesc="A module for working with NMR data in Python"
arch=(any)
url="http://www.nmrglue.com"
license=(BSD-3-Clause)
depends=(python-scipy python-matplotlib python-ipywidgets)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://github.com/jjhelmus/nmrglue/releases/download/v$pkgver/$_pyname-$pkgver.tar.gz)
sha256sums=('9e740a02d34ce5df9eb0390274c6a5f37b4837d59139512a3dd169106a8e3fe1')

prepare() {
  cd "$srcdir/$_pyname-$pkgver"
  sed -i 's/recfromtxt/genfromtxt/g' $_pyname/fileio/*.py
}

build() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m build \
    --wheel \
    --no-isolation \
    --skip-dependency-check
}

check() {
  cd "$srcdir/$_pyname-$pkgver"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl

  test-env/bin/python -m pytest -v --pyargs nmrglue
}

package() {
  cd "$srcdir/$_pyname-$pkgver"

  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=2 \
    dist/*.whl

  install -Dm755 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
