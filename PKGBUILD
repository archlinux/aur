# Maintainer:  Anton Kudelin <kudelin at proton dot me>
# Contributor: Jerry Lin <jerry73204 at gmail dot com>

_pyname=kafka
pkgname=python-$_pyname
pkgver=2.1.3
pkgrel=1
pkgdesc='Python client for Apache Kafka'
arch=(x86_64 aarch64)
url="https://github.com/dpkp/kafka-python"
license=(Apache-2.0)
depends=(python-snappy python-lz4 python-crc32c python-zstandard python-xxhash)
makedepends=(python-setuptools python-build python-installer python-wheel)
checkdepends=(python-mock python-pytest-mock)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=('14052c9148b991065dce0ccc073593a31c63829763914e3ba573465e459f7e07')

build() {
  cd "$srcdir/$_pyname-python-$pkgver"
  python -m build \
    --wheel \
    --no-isolation \
    --skip-dependency-check
}

check() {
  cd "$srcdir/$_pyname-python-$pkgver"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl

  mv $_pyname $_pyname-orig

  test-env/bin/python -m pytest -v
}

package() {
  cd "$srcdir/$_pyname-python-$pkgver"
  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=2 \
    dist/*.whl
}
