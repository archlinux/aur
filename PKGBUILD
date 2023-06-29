# Maintainer:  Anton Kudelin <kudelin at proton dot me>

_pyname=flower
pkgname=python-$_pyname
pkgver=2.0.0
pkgrel=1
pkgdesc='Real-time monitor and web admin for Celery distributed task queue'
arch=(any)
url='https://github.com/mher/flower'
license=(BSD)
depends=(python-redis python-humanize python-prometheus_client)
makedepends=(python-setuptools python-build python-installer python-wheel)
checkdepends=(python-pytest python-tornado python-celery)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('5acc2de1968763571674b6c4cd0988e78fb132b47369af3f151fe5af4cb25f12')

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

  test-env/bin/python -m pytest -v -k 'not test_legacy'
}

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=2 \
    dist/*.whl
  install -Dm755 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE.TXT"
}
