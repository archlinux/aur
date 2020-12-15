# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Simon 'ALSimon' Gilliot <simon@gilliot.fr>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>
# Contributor: Dobroslaw Kijowski

pkgname=mitmproxy
pkgver=6.0.0
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
sha512sums=('dbf4ba21a35c97237e861f570c17f9aa4826de1f85ca1147b134c8e6e8a2853e0ebd7f11cdbfe9e04b344c394f88b853f062778fd5f474f2fe75e0736bd3f9b8')

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
