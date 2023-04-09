# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-mocket
pkgver=3.10.9
pkgrel=2
pkgdesc="Socket Mock Framework - for all kinds of socket animals, web-clients included - with gevent/asyncio/SSL support"
url="https://github.com/mindflayer/python-mocket"
license=('BSD')
arch=('any')
depends=('python-decorator' 'python-http-parser' 'python-magic' 'python-urllib3')
makedepends=('python-pipenv-to-requirements' 'python-setuptools')
checkdepends=('pifpaf' 'python-pytest' 'python-pytest-asyncio' 'python-aiohttp' 'python-fastapi'
              'python-gevent' 'python-httpx' 'python-pook' 'python-redis'
              'python-requests' 'python-sure' 'python-xxhash' 'redis')
source=("https://github.com/mindflayer/python-mocket/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('713ac111a88f0e629949baac098a9a80fca0ccb7f797d27a332b3634219c4a230e593d1c1a9a8d07a206f12662ad1d6cdbb1c0f33b69d828376147d9bbac2d48')

prepare() {
  cd python-mocket-$pkgver
  sed -i 's/--cov=mocket --cov-report=term-missing//' pytest.ini
  pipenv_to_requirements
}

build() {
  cd python-mocket-$pkgver
  python setup.py build
}

check() {
  cd python-mocket-$pkgver
  pifpaf run redis pytest
}

package() {
  cd python-mocket-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
