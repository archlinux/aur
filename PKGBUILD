# Maintainer: John Ettedgui <git@johne.rojalabs.com>

pkgname=python-cashews
_pyname=cashews
_sdist=${_pyname//-/_}
pkgver=7.6.0
pkgrel=1
pkgdesc='Cache tools with async power'
arch=('any')
url='https://github.com/Krukov/cashews'
license=('MIT')
depends=('python')
optdepends=(
  'python-redis: redis backend'
  'python-diskcache: disk backend'
  'python-bitarray: speedup extras'
  'python-xxhash: speedup extras'
  'python-hiredis: speedup extras'
  'python-dill: dill pickler'
  'python-prometheus_client: Prometheus metrics middleware'
  'python-starlette: FastAPI/Starlette middleware'
  'python-sqlalchemy: SQLAlchemy pickler support'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$_sdist-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pyname:0:1}/$_pyname/$_sdist-$pkgver.tar.gz")
sha256sums=('fc2456d9153ca424f26b040ef053d000f9092c65b1ad6e6330f66fea95d503f0')

# Honcho pins cashews==7.5.0 upstream, but 7.6.0 keeps the same public API and
# the same SafeRedisCluster.initialize(self) signature that Honcho's redis-py 8
# compatibility shim patches.  Track the current release rather than the
# lockfile version; verified by importing src.cache.client against 7.6.0.

build() {
  cd "$_sdist-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_sdist-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Upstream's tests need pytest plus redis/disk backends; not run.
