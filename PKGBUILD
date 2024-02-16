# Maintainer: BigfootACA <bigfoot@classfun.cn>

pkgname=python-pymemcache
_pkgname=${pkgname#python-}
pkgver=4.0.0
pkgrel=1
pkgdesc="A comprehensive, fast, pure Python memcached client"
arch=(any)
url="https://github.com/pinterest/pymemcache"
license=(Apache-2.0)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  memcached
  python-faker
  python-gevent
  python-memcached
  python-pylibmc
  python-pytest
  python-zstd
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "dont-install-tests.patch"
)
sha256sums=(
  '824b62cb1f099537345abf399a8f419138e9e86b0cf59d3b5c105e8c3ee9828f'
  '04085134ced763386e28b1302d39a05bd15b738d1b61e946f427a535c18860b3'
)

_archive="$_pkgname-$pkgver"

prepare() {
  cd "$_archive"

  patch --strip=1 --input="$srcdir/dont-install-tests.patch"
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  memcached --daemon --port 49152 --pidfile "$PWD/memcached.pid"
  trap 'kill $(cat '"$PWD/memcached.pid"')' EXIT
  # Deselected tests failing due to:
  #   TypeError: 'dict' object is not an iterator
  pytest --override-ini="addopts=" pymemcache/test/ \
    --port 49152 \
    --deselect pymemcache/test/test_benchmark.py::test_bench_delete
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
