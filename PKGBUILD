# Maintainer:  Anton Kudelin <kudelin at proton dot me>
# Contributor: Jerry Lin <jerry73204 at gmail dot com>

_pyname=kafka
pkgname=python-$_pyname
pkgver=2.0.6
pkgrel=1
pkgdesc='Python client for Apache Kafka'
arch=(x86_64 aarch64)
url="https://github.com/dpkp/kafka-python"
license=(Apache)
depends=(python-snappy python-lz4 python-crc32c python-zstandard python-xxhash)
makedepends=(python-setuptools python-build python-installer python-wheel)
checkdepends=(python-mock python-pytest-mock)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=('6a94745f17f9c22b63a89c907120d1dfdcff0f2781eb15214d5acca5cb492757')

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
