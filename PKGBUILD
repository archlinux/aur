# Maintainer:  Anton Kudelin <kudelin at proton dot me>
# Contributor: Cem Aydin <cem.aydin@gmx.ch>

_pyname=flask-jwt-extended
pkgname=python-$_pyname
pkgver=4.6.0
pkgrel=1
arch=(any)
pkgdesc='A Flask extension that provides JWT support (with batteries included)!'
url='https://github.com/vimalloc/flask-jwt-extended'
license=(MIT)
depends=(python-flask python-pyjwt)
makedepends=(python-setuptools python-build python-installer python-wheel)
checkdepends=(python-pytest python-dateutil python-cryptography)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('d7415d24049c72a8ad340a653d3202ee31a2db9ceba73d77ab05fdd9cc2e34e4')

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

  test-env/bin/python -m pytest
}

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=2 \
    dist/*.whl

  install -Dm755 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

