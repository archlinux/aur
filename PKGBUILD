# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Simon 'ALSimon' Gilliot <simon@gilliot.fr>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>
# Contributor: Dobroslaw Kijowski

pkgname=mitmproxy
pkgver=6.0.1
pkgrel=1
pkgdesc='SSL-capable man-in-the-middle HTTP proxy'
arch=('any')
url='https://mitmproxy.org'
license=('MIT')
depends=('python-asgiref' 'python-blinker' 'python-brotli' 'python-click' 'python-cryptography'
         'python-flask' 'python-h2' 'python-hyperframe' 'python-kaitaistruct' 'python-ldap3'
         'python-msgpack' 'python-passlib' 'python-protobuf' 'python-pyasn1' 'python-pyopenssl'
         'python-pyparsing' 'python-pyperclip' 'python-ruamel-yaml' 'python-setuptools'
         'python-sortedcontainers' 'python-tornado' 'python-urwid' 'python-wsproto'
         'python-publicsuffix2' 'python-zstandard')
checkdepends=('python-asynctest' 'python-parver' 'python-pytest-runner' 'python-pytest-asyncio'
              'python-requests' 'python-hypothesis')
provides=('pathod')
conflicts=('pathod')
replaces=('pathod')
source=("https://github.com/mitmproxy/mitmproxy/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('848ced92f16863da1c41cbb33fe9fec76b837336e2f252860de80039463b1b7527caa7928124885105c25b922a1cd26c4414f75dd4f1ae950624271d7df47023')

prepare() {
  cd $pkgname-$pkgver

  # Let's remove all the upper bounds and use system ca-certificatescate store
  # We have an old protobuf, but this should not be an issue
  sed -e '/certifi/d' \
      -e 's/, *<[0-9=.]*//' \
      -e 's/protobuf>=3.14/protobuf>=3/' \
      -i setup.py
  sed -e '/import certifi/d' \
      -e 's|certifi.where()|"/etc/ssl/certs/ca-certificates.crt"|' \
      -i mitmproxy/net/tls.py
}

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

check() {
  cd $pkgname-$pkgver
  python setup.py pytest --addopts "--deselect test/mitmproxy/test_version.py::test_get_version"
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" -O1

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
