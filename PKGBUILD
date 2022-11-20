# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-elasticsearch
pkgver=7.9.0
pkgrel=1
arch=('any')
pkgdesc='Python client for Elasticsearch'
url='https://github.com/elastic/elasticsearch-py'
license=('Apache')
depends=('python38-certifi' 'python38-urllib3')
makedepends=('python38-setuptools' 'git')
checkdepends=('python38-requests' 'python38-mock' 'python38-yaml' 'python38-pytest' 'python38-numpy'
              'python38-pandas' 'python38-aiohttp' 'python38-pytest-asyncio')
source=("$pkgname-$pkgver.tar.gz::https://github.com/elastic/elasticsearch-py/archive/$pkgver.tar.gz")
        #python310.patch)
#       git+https://github.com/elastic/elasticsearch.git)
sha512sums=('2fae863434f7bf06c0669426b4a261f5d0c9ea26bd68783393bf25521e46484a0d6267438ae73590b7961b2a1b1a347cf89f33a9904983a82469b25b14894657'
            '495694c1d89ad453fd1d2e83092a741a256cbe5627ebcca22770b340a9ac77fabcdea83fa84f1c9c0ffe734517a099f98ee8a95f1384b5f716eb34273a21b39f')

# prepare() {
#   cd elasticsearch-py-$pkgver
#   patch -Np1 -F3 -i ../python310.patch
# }

build() {
  cd elasticsearch-py-$pkgver
  python3.8 setup.py build
}

check() {
  cd elasticsearch-py-$pkgver
  # Skip tests that requires a running elasticsearch server
  #TEST_ES_REPO="$srcdir"/elasticsearch
  # TODO: test_elasticsearch/test_async/test_transport.py::TestTransport::test_sniff_on_fail_failing_does_not_prevent_retires
  pytest --deselect test_elasticsearch/test_async/test_server --deselect  test_elasticsearch/test_async/test_transport.py::TestTransport::test_sniff_on_fail_failing_does_not_prevent_retires
}

package() {
  cd elasticsearch-py-$pkgver
  python3.8 setup.py install --root "$pkgdir" --optimize=1
}
