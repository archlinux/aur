# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Simon 'ALSimon' Gilliot <simon@gilliot.fr>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>
# Contributor: Dobroslaw Kijowski

pkgname=mitmproxy
pkgver=5.1.0
pkgrel=1
pkgdesc='SSL-capable man-in-the-middle HTTP proxy'
arch=('any')
url='https://mitmproxy.org'
license=('MIT')
depends=('python-blinker' 'python-brotli' 'python-click' 'python-cryptography' 'python-flask'
         'python-h2' 'python-hyperframe' 'python-kaitaistruct' 'python-ldap3' 'python-passlib'
         'python-protobuf' 'python-pyasn1' 'python-pyopenssl' 'python-pyparsing' 'python-pyperclip'
         'python-ruamel-yaml' 'python-setuptools' 'python-sortedcontainers' 'python-tornado'
         'python-urwid' 'python-wsproto' 'python-publicsuffix2' 'python-zstandard')
checkdepends=('python-asynctest' 'python-beautifulsoup4' 'python-parver' 'python-pytest-runner'
              'python-pytest-asyncio' 'python-requests' 'python-hypothesis')
provides=('pathod')
conflicts=('pathod')
replaces=('pathod')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mitmproxy/mitmproxy/archive/v$pkgver.tar.gz")
sha512sums=('cec15a5651f4e5826ced45cd43d6c83af1f2922f6d25e7a20032e152c37eebc82b1d83dff63d729f02a72ff58b8ca70df737850e44e5f8dbfd65113807f0a1e9')

prepare() {
  cd $pkgname-$pkgver

  # Let's remove all the upper bounds and use system ca-certificatescate store
  sed -e '/certifi/d' \
      -e 's/, *<[0-9=.]*//' \
      -e 's/==/>=/' \
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
  python setup.py pytest
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" -O1

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
