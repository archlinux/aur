# Maintainer:  Anton Kudelin <kudelin at proton dot me>
# Contributor: Cem Aydin <cem.aydin@gmx.ch>

_pyname=flask-jwt-extended
pkgname=python-$_pyname
pkgver=4.5.3
pkgrel=1
arch=(any)
pkgdesc='A Flask extension that provides JWT support (with batteries included)!'
url='https://github.com/vimalloc/flask-jwt-extended'
license=(MIT)
depends=(python-flask python-pyjwt)
makedepends=(python-setuptools python-build python-installer python-wheel)
checkdepends=(python-pytest python-dateutil python-cryptography)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('fc90b317d72546b17c20c8013219870dec174cf2d0d10424b435e11f36b25d07')

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

