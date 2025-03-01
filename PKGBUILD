# Maintainer: Benjamin Winger <bmw@disroot.org>

_pkgname=RestrictedPython
pkgname=python-restrictedpython
pkgver=8.0
pkgrel=1
pkgdesc="A restricted execution environment for Python to run untrusted code"
arch=(any)
url="https://github.com/zopefoundation/RestrictedPython"
license=(ZPL)
depends=("python")
makedepends=("python" "python-setuptools" "python-installer" "python-build" "python-wheel")
checkdepends=("python-pytest" "python-pytest-mock")
source=("https://github.com/zopefoundation/$_pkgname/archive/$pkgver.tar.gz")
b2sums=('6eb5cba6c63bcf3ef3dc6fdd8df875b0bdf9f8cc2e967ada0b9e47129dd2df021ff525c3e9f3563270e8073e39fc9695eb3bb6b3060396f9c17910083b8002bf')

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  PYTHONPATH=src py.test
}

prepare() {
    cd $srcdir/$_pkgname-$pkgver
    # Setuptools 75 seems to work fine
    sed -i 's/setuptools <= 75\.6\.0/setuptools/g' pyproject.toml
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
