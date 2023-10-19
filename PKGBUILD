# Maintainer:  Anton Kudelin <kudelin at proton dot me>
# Contributor: Håvard Pettersson <mail@haavard.me>

_pyname=yahoofinancials
pkgname=python-$_pyname
pkgver=1.16
pkgrel=1
pkgdesc='A financial data module used for pulling data from Yahoo Finance'
url='https://github.com/JECSand/yahoofinancials'
arch=(any)
license=(MIT)
depends=(python-requests python-beautifulsoup4 python-pytz python-cryptography)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=('722d525f70c1538bb0deb41fe45a87efea7dbc22777d5124766c4927c4517bf4')

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

  test-env/bin/python -m pytest -v
}

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m installer dist/*.whl \
    --destdir="$pkgdir" \
    --compile-bytecode=2
}
