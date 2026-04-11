# Maintainer: Benjamin Winger <bmw@disroot.org>

_pkgname=RestrictedPython
pkgname=python-restrictedpython
pkgver=8.1
pkgrel=1
pkgdesc="A restricted execution environment for Python to run untrusted code"
arch=(any)
url="https://github.com/zopefoundation/RestrictedPython"
license=(ZPL)
depends=("python")
makedepends=("python" "python-setuptools" "python-installer" "python-build" "python-wheel")
checkdepends=("python-pytest" "python-pytest-mock")
source=("https://github.com/zopefoundation/$_pkgname/archive/$pkgver.tar.gz")
b2sums=('aa67f12f81541ea0a791028bcdf053dbcb9e0f19e7c27ddafa722ffa86a4d944378616db37d44f448d0b763e192c171fa343b4aa204d2e3665f850d4f81ecf0f')

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  PYTHONPATH=src py.test
}

prepare() {
    cd $srcdir/$_pkgname-$pkgver
    # Setuptools 82 seems to work fine
    sed -i 's/setuptools >= 78.1.1,< 81/setuptools/g' pyproject.toml
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
