# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Jerry Lin <jerry73204 at gmail dot com>

_pyname=aiokafka
pkgname=python-$_pyname
pkgver=0.8.1
pkgrel=1
pkgdesc='Asyncio client for Kafka'
arch=(x86_64 aarch64)
url='https://aiokafka.readthedocs.io'
license=(Apache)
depends=(python-kafka python-async-timeout)
makedepends=(python-setuptools cython python-build python-installer python-wheel)
checkdepends=(python-pytest-asyncio python-docker python-snappy
              python-zstandard python-lz4)
source=($pkgname-$pkgver.tar.gz::https://github.com/aio-libs/aiokafka/archive/v$pkgver.tar.gz)
sha256sums=('e0861cdb34a4e023ac9b211dcd7140ae4b78e44ef6fcffbf2b6ce917db8351c9')

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

  mv $_pyname $_pyname-orig

  test-env/bin/python -m pytest -v -k 'not test_legacy'
}

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=2 \
    dist/*.whl
}
