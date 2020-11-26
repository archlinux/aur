# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Simon 'ALSimon' Gilliot <simon@gilliot.fr>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>
# Contributor: Dobroslaw Kijowski

pkgname=mitmproxy
pkgver=5.3.0
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
sha512sums=('3f52f5285869de49c7c04ef9b6c0f3ef66689eb45fb6f9e971111049bf1aa0777e3e84b51f7031c1bdf105ce3f17fa4b03036d72617985b92996c6eea7566c38')

prepare() {
  cd $pkgname-$pkgver

  # Let's remove all the upper bounds and use system ca-certificatescate store
  # urwid is pinned because the issue seems to affect Mac only
  # dataclasses should not be installed at all, not sure why.
  sed -e '/certifi/d' \
      -e 's/, *<[0-9=.]*//' \
      -e 's/,!=2.1.0//' \
      -e 's/==/>=/' \
      -e '/dataclasses/d' \
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
