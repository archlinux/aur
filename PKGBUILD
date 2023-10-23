# Maintainer:  Anton Kudelin <kudelin at proton dot me>

_pyname=hiro
pkgname=python-$_pyname
pkgver=1.1.1
pkgrel=1
arch=(any)
pkgdesc='Time manipulation utilities for testing'
url='https://hiro.readthedocs.io'
license=(MIT)
depends=(python)
makedepends=(python-setuptools python-build python-installer python-wheel)
checkdepends=(python-pytest)
source=($pkgname-$pkgver.tar.gz::https://github.com/alisaifee/hiro/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('683f416c5428c37a01f843baa042c8c3129ba2f91edcd35a6b826392cc51f278')

build() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m build \
    --wheel \
    --no-isolation \
    --skip-dependency-check
}

check() {
  cd "$srcdir/$_pyname-$pkgver"
  mv pytest.ini pytest.ini.orig

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
