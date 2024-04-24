# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-mocket
pkgver=3.12.5
pkgrel=1
pkgdesc="Socket Mock Framework - for all kinds of socket animals, web-clients included - with gevent/asyncio/SSL support"
url="https://github.com/mindflayer/python-mocket"
license=('BSD')
arch=('any')
depends=('python-decorator' 'python-httptools' 'python-magic' 'python-urllib3')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('pifpaf' 'python-pytest' 'python-pytest-asyncio' 'python-aiohttp' 'python-fastapi'
              'python-gevent' 'python-httpx' 'python-pook' 'python-redis' 'python-asgiref'
              'python-requests' 'python-sure' 'python-xxhash' 'redis')
source=("https://github.com/mindflayer/python-mocket/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('c482bd266ffb5ef37c400f238de03ede46c6095a61623b29f569bf1982f42999838d8a367489e3da5197b8b0693b22a35b15cf9c9b4cf3e0e8ad8bfb79c90e9c')

prepare() {
  cd python-mocket-$pkgver
  sed -i 's/--cov=mocket --cov-report=term-missing//' pytest.ini
}

build() {
  cd python-mocket-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd python-mocket-$pkgver
  # Disable tests which depend on an running nginx container
  # TODO: report test_no_dangling_fds failure
  SKIP_TRUE_HTTP=true pifpaf run redis pytest -- -k 'not HttpEntryTestCase and not test_no_dangling_fds'
}

package() {
  cd python-mocket-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
