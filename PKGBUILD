# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon 'ALSimon' Gilliot <simon@gilliot.fr>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>

pkgname=mitmproxy
pkgver=0.17
pkgrel=2
pkgdesc="SSL-capable man-in-the-middle HTTP proxy"
arch=('any')
url="http://mitmproxy.org/"
license=('GPL')
depends=('python2-blinker' 'python2-click' 'python2-configargparse' 'python2-construct'
         'python2-cryptography' 'python2-flask' 'python2-h2' 'python2-hpack'
         'python2-html2text' 'python2-hyperframe' 'python2-lxml' 'python2-pillow'
         'python2-passlib' 'python2-pyasn1' 'python2-pyopenssl' 'python2-pyparsing'
         'python2-pyperclip' 'python2-requests' 'python2-six' 'python2-tornado'
         'python2-urwid' 'python2-watchdog' 'python2-enum34' 'python2-ipaddress')
optdepends=('python2-cssutils: Contentviews - Beautifies CSS files'
            'python2-protobuf: Contentviews - Extended content decoding'
            'python2-pyamf: Contentviews - Decodes AMF files')
makedepends=('git')
checkdepends=('python2-beautifulsoup4' 'python2-harparser' 'python2-mock'
              'python2-pytest-runner' 'python2-pytest-timeout')
provides=('python2-libmproxy' 'python2-netlib' 'pathod')
conflicts=('python2-libmproxy' 'python2-netlib' 'pathod')
replaces=('python2-libmproxy' 'python2-netlib' 'pathod')
source=("git+https://github.com/mitmproxy/mitmproxy.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd mitmproxy

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
  python2 setup.py ptr
}
 
package() {
  cd mitmproxy
  python2 setup.py install --root="$pkgdir" -O1
}
