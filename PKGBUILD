# Maintainer: Mikhail felixoid Shiryaev <mr dot felixoid on gmail>

_name=clickhouse-connect
pkgname="python-${_name}"
pkgver=0.8.15
pkgrel=1
pkgdesc='A high performance core database driver for connecting ClickHouse to Python, Pandas, and Superset'
arch=('any')
url='https://github.com/ClickHouse/clickhouse-connect'
makedepends=(python-setuptools python-build python-installer python-wheel cython)
depends=(python-requests python-pytz python-lz4 python-zstandard python-certifi)
checkdepends=(python-pytest-asyncio python-sqlalchemy python-pandas)
license=(Apache-2.0)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=(3b90502ec2ce320b0e57a87d58ecb75570ff7bbdda301c590645182aab9011f4)

build() {
  cd "$srcdir/$_name-$pkgver"
  python -m build \
    --wheel \
    --no-isolation \
    --skip-dependency-check
}

check() {
  cd "$srcdir/$_name-$pkgver"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl

  mv clickhouse_connect $_name-orig

  test-env/bin/python -m pytest tests/unit_tests
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=2 \
    dist/*.whl
}
