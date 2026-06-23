# Maintainer:  Anton Kudelin <kudelin at proton dot me>
# Contributor: Jerry Lin <jerry73204 at gmail dot com>

_pyname=kafka
pkgname=python-$_pyname
pkgver=3.0.4
pkgrel=1
pkgdesc='Python client for Apache Kafka'
arch=(any)
url="https://github.com/dpkp/kafka-python"
license=(Apache-2.0)
depends=(python python-snappy python-lz4 python-crc32c python-zstandard python-xxhash)
makedepends=(python-setuptools python-build python-installer python-wheel)
checkdepends=(python-pytest-mock python-pytest-timeout)
optdepends=('python-yaml: YAML logging config for the CLI')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=('332c3926cddceb361ff6b766915adb1141e9fda28ad3f8af8d6a58722e7bed58')

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

  test-env/bin/python -m pytest -v test
}

package() {
  cd "$srcdir/$_pyname-python-$pkgver"
  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=2 \
    dist/*.whl

  rm -r "$pkgdir"/usr/lib/python*/site-packages/test
}
