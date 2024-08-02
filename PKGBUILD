# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-mocket
pkgver=3.12.8
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
sha512sums=('1188423ee110967b2bd64cd5760ceda68ec852df4a0b1e2e169bc59714f28fecc777b7e676fcb8be104e1f6cd86bd34bd8507e1ea2dd65b4f6650c1231ce9c0e')

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

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/mocket-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
