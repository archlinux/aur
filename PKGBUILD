# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon 'ALSimon' Gilliot <simon@gilliot.fr>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>

pkgname=mitmproxy
pkgver=0.18.2
pkgrel=1
pkgdesc="SSL-capable man-in-the-middle HTTP proxy"
arch=('any')
url="http://mitmproxy.org/"
license=('GPL')
depends=('python-blinker' 'python-brotlipy' 'python-click' 'python-configargparse'
         'python-construct' 'python-cryptography' 'python-cssutils' 'python-flask' 'python-h2'
         'python-html2text' 'python-hyperframe' 'python-jsbeautifier' 'python-lxml' 'python-pillow'
         'python-passlib' 'python-pyasn1' 'python-pyopenssl' 'python-pyparsing' 'python-pyperclip'
         'python-sortedcontainers' 'python-requests' 'python-tornado' 'python-urwid'
         'python-watchdog')
optdepends=('python-protobuf: Contentviews - Extended content decoding')
makedepends=('git')
checkdepends=('python-beautifulsoup4' 'python-harparser' 'python-mock' 'python-pytest-runner'
              'python-pytest-timeout' 'python-pytz' 'python-pytz')
provides=('pathod')
conflicts=('pathod')
replaces=('pathod')
source=("git+https://github.com/mitmproxy/mitmproxy.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd mitmproxy

  sed -i 's/length_field/lengthfield/' mitmproxy/contrib/tls/_constructs.py

  # Let's remove all the upper bounds, use system certificate store and ssl.match_hostname
  sed -e '/certifi/d' \
      -e '/backports.ssl_match_hostname/d' \
      -e 's/, *<[0-9=.]*//' \
      -i setup.py
  sed -e '/import certifi/d' \
      -e 's|certifi.where()|"/etc/ssl/certs/ca-certificates.crt"|' \
      -e 's/from backports import ssl_match_hostname/import ssl as ssl_match_hostname/' \
      -i netlib/tcp.py
}

check() {
  cd mitmproxy
  python setup.py ptr
}
 
package() {
  cd mitmproxy
  python setup.py install --root="$pkgdir" -O1
}
