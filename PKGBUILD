# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Simon 'ALSimon' Gilliot <simon@gilliot.fr>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>
# Contributor: Dobroslaw Kijowski

pkgname=mitmproxy
pkgver=5.1.1
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
sha512sums=('ac5cd82d4d89590b57625661c493aca6a702605c612ea1acd9e0d0806067d47f60085ee68260bba2a10dc343410ae6a76ea1575287a0e312e4467a4e8485c6e1')

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
