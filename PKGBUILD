# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon 'ALSimon' Gilliot <simon@gilliot.fr>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>

pkgname=mitmproxy
pkgver=2.0.0
pkgrel=1
pkgdesc="SSL-capable man-in-the-middle HTTP proxy"
arch=('any')
url="http://mitmproxy.org/"
license=('GPL')
depends=('python-blinker' 'python-brotlipy' 'python-click' 'python-construct' 'python-cryptography'
         'python-cssutils' 'python-h2' 'python-html2text' 'python-hyperframe' 'python-jsbeautifier'
         'python-kaitaistruct' 'python-passlib' 'python-pyasn1' 'python-pyopenssl'
         'python-pyparsing' 'python-pyperclip' 'python-requests' 'python-ruamel-yaml'
         'python-setuptools' 'python-sortedcontainers' 'python-tornado' 'python-urwid'
         'python-watchdog')
optdepends=('protobuf: Contentviews - Extended content decoding')
makedepends=('git')
checkdepends=('python-beautifulsoup4' 'python-flask' 'python-pytz' 'python-pytest-runner'
              'protobuf')
provides=('pathod')
conflicts=('pathod')
replaces=('pathod')
source=("git+https://github.com/mitmproxy/mitmproxy.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd mitmproxy

  # Let's remove all the upper bounds and use system certificate store
  sed -e '/certifi/d' \
      -e 's/, *<[0-9=.]*//' \
      -i setup.py
  sed -e '/import certifi/d' \
      -e 's|certifi.where()|"/etc/ssl/certs/ca-certificates.crt"|' \
      -i mitmproxy/net/tcp.py
}

check() {
  cd mitmproxy
  LC_CTYPE=en_US.UTF-8 python setup.py pytest
}

package() {
  cd mitmproxy
  python setup.py install --root="$pkgdir" -O1
}
