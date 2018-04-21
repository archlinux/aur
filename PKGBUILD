# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon 'ALSimon' Gilliot <simon@gilliot.fr>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>

pkgname=mitmproxy
pkgver=3.0.4
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
sha512sums=('a89b0bee6997ce51d23483101755dae9f5300339d65e4975679df5c6b60ff9af94e655651321cd8e831666a04ec5cc24c7af647f3aab913524b6755b47f1f57b')

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
  python setup.py pytest
}

package() {
  cd mitmproxy-$pkgver
  python setup.py install --root="$pkgdir" -O1
}
