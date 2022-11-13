# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-mocket
pkgver=3.10.8
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
sha512sums=('d89e09e7656e46ea21ab0963e3ff64b5058c90f4c360af32a25e728035a1ddb1ebf450e7585ee60aa8ba587e1b2266718fb9e0bc6851ad03bcbea7a45336dbf1')

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
