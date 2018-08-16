# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon 'ALSimon' Gilliot <simon@gilliot.fr>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>

pkgname=mitmproxy
pkgver=4.0.4
pkgrel=2
pkgdesc="SSL-capable man-in-the-middle HTTP proxy"
arch=('any')
url="https://mitmproxy.org/"
license=('MIT')
depends=('python-blinker' 'python-brotlipy' 'python-click' 'python-cryptography' 'python-h2'
         'python-hyperframe' 'python-kaitaistruct' 'python-ldap3' 'python-passlib' 'python-protobuf'
         'python-pyasn1' 'python-pyopenssl' 'python-pyparsing' 'python-pyperclip'
         'python-ruamel-yaml' 'python-setuptools' 'python-sortedcontainers' 'python-tornado'
         'python-urwid' 'python-wsproto')
checkdepends=('python-asynctest' 'python-flask' 'python-parver' 'python-pytest-runner'
              'python-pytest-asyncio' 'python-requests')
provides=('pathod')
conflicts=('pathod')
replaces=('pathod')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mitmproxy/mitmproxy/archive/v$pkgver.tar.gz")
sha512sums=('e08ea8b1c75a95b822c463625509037bbc8a979161cacaa1f0185f98df8d6d7e5400925365dbbe70d18751251b1005824f739a8cd035c0389f7b4aea562adfb3')

prepare() {
  cd $pkgname-$pkgver

  # Let's remove all the upper bounds and use system certificate store
  sed -e '/certifi/d' \
      -e 's/, *<[0-9=.]*//' \
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
  python setup.py pytest || warning "https://github.com/mitmproxy/mitmproxy/issues/3287"
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" -O1

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
