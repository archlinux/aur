# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-mocket
pkgver=3.10.4
pkgrel=1
pkgdesc="Socket Mock Framework - for all kinds of socket animals, web-clients included - with gevent/asyncio/SSL support"
url="https://github.com/mindflayer/python-mocket"
license=('BSD')
arch=('any')
depends=('python-decorator' 'python-http-parser' 'python-magic' 'python-urllib3')
makedepends=('python-pipenv-to-requirements' 'python-pytest-cov' 'python-setuptools')
checkdepends=('pifpaf' 'python-aiohttp' 'python-gevent' 'python-mock' 'python-pook' 'python-redis'
              'python-sure' 'python-xxhash' 'redis')
source=("https://github.com/mindflayer/python-mocket/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('11a9d5d83d8244a5699a03df18861bd433d5af47be57a2593e5a35210f6f54bad7cb2c8882ebfa727ffa47c61cabd6071bab839eec635116b1d0af781f9efb08')

prepare() {
  cd python-mocket-$pkgver
  pipenv_to_requirements

  sed -i 's/^python-magic.*/file_magic/' requirements.txt
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
