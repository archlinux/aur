# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-mocket
pkgver=3.8.6
pkgrel=1
pkgdesc="Socket Mock Framework - for all kinds of socket animals, web-clients included - with gevent/asyncio/SSL support"
url="https://github.com/mindflayer/python-mocket"
license=('BSD')
arch=('any')
depends=('python-decorator' 'python-magic' 'python-urllib3' 'python-six')
makedepends=('python-pipenv-to-requirements' 'python-pytest-cov' 'python-setuptools')
checkdepends=('pifpaf' 'python-aiohttp' 'python-gevent' 'python-mock' 'python-pook' 'python-redis'
              'python-sure' 'redis')
source=("https://github.com/mindflayer/python-mocket/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        file-magic.patch)
sha512sums=('76e98927b4c8c3912309fe9341519d9e986538010e5a8fcf3efe95e04793d4da27f9d6472ce54db4199bb0535dd959d1d9f957c4be8ab8edbf4194845e194b16'
            '03abc1d8bb73988c573dec87ce10b8aae52924117732372764b7118040645270d89c7daa5c415cd6d7efd9a0ba1e24478c29419d4a777d9d27a882bf7b6836e7')

prepare() {
  cd python-mocket-$pkgver
  pipenv_to_requirements

  patch -p1 -i ../file-magic.patch
}

build() {
  cd python-mocket-$pkgver
  python setup.py build
}

check() {
  cd python-mocket-$pkgver
  # https://github.com/mindflayer/python-mocket/issues/119
  pifpaf run redis -- pytest --deselect tests/main/test_http_with_xxhash.py::HttpEntryTestCase::test_truesendall_with_dump_from_recording
}

package() {
  cd python-mocket-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
