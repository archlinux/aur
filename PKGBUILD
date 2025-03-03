# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Jerry Lin <jerry73204 at gmail dot com>

_pyname=aiokafka
pkgname=python-$_pyname
pkgver=0.12.0
pkgrel=1
pkgdesc='Asyncio client for Kafka'
arch=(x86_64 aarch64)
url='https://aiokafka.readthedocs.io'
license=(Apache)
depends=(python-kafka python-async-timeout)
makedepends=(python-setuptools cython python-build python-installer python-wheel)
checkdepends=(python-pytest-asyncio python-docker python-snappy
              python-zstandard python-lz4 python-pytest-mock)
source=($pkgname-$pkgver.tar.gz::https://github.com/aio-libs/aiokafka/archive/v$pkgver.tar.gz)
sha256sums=('d71e708393708d00524bd522caabde8b3b488c6fd6e8b96662a60510c22d9f99')

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

  test-env/bin/python -m pytest -v
}

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=2 \
    dist/*.whl
}
