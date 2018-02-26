# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon 'ALSimon' Gilliot <simon@gilliot.fr>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>

pkgname=mitmproxy
pkgver=3.0.3
pkgrel=1
pkgdesc="SSL-capable man-in-the-middle HTTP proxy"
arch=('any')
url="http://mitmproxy.org/"
license=('GPL')
depends=('python-blinker' 'python-brotlipy' 'python-click' 'python-cryptography' 'python-h11'
         'python-h2' 'python-hyperframe' 'python-kaitaistruct' 'python-ldap3' 'python-passlib'
         'python-pyasn1' 'python-pyopenssl' 'python-pyparsing' 'python-pyperclip' 'python-requests'
         'python-ruamel-yaml' 'python-setuptools' 'python-sortedcontainers' 'python-tornado'
         'python-urwid' 'python-wsproto')
checkdepends=('python-beautifulsoup4' 'python-flask' 'python-pytest-runner')
provides=('pathod')
conflicts=('pathod')
replaces=('pathod')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mitmproxy/mitmproxy/archive/v$pkgver.tar.gz")
sha512sums=('5477b8ac438b8f2ea40e658c50988881ef0f3eeda3178b2fbed9618d2a490c28f59b32174e150d8cbeb1b04b4b868a64029bde6499983dff782d4204aa0f8d37')

prepare() {
  cd mitmproxy-$pkgver

  # Let's remove all the upper bounds and use system certificate store
  sed -e '/certifi/d' \
      -e 's/, *<[0-9=.]*//' \
      -i setup.py
  sed -e '/import certifi/d' \
      -e 's|certifi.where()|"/etc/ssl/certs/ca-certificates.crt"|' \
      -i mitmproxy/net/tls.py
}

check() {
  cd mitmproxy-$pkgver
  # https://github.com/mitmproxy/mitmproxy/issues/2892
  python setup.py pytest || warning "Tests failed"
}

package() {
  cd mitmproxy-$pkgver
  python setup.py install --root="$pkgdir" -O1
}
