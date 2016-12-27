# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon 'ALSimon' Gilliot <simon@gilliot.fr>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>

pkgname=mitmproxy
pkgver=1.0
pkgrel=1
pkgdesc="SSL-capable man-in-the-middle HTTP proxy"
arch=('any')
url="http://mitmproxy.org/"
license=('GPL')
depends=('python-blinker' 'python-brotlipy' 'python-click' 'python-construct' 'python-cryptography'
         'python-cssutils' 'python-flask' 'python-h2' 'python-html2text' 'python-hyperframe'
         'python-jsbeautifier' 'python-pillow' 'python-passlib' 'python-pyasn1' 'python-pyopenssl'
         'python-pyparsing' 'python-pyperclip' 'python-ruamel-yaml' 'python-sortedcontainers'
         'python-requests' 'python-tornado' 'python-urwid' 'python-watchdog')
optdepends=('python-protobuf: Contentviews - Extended content decoding')
makedepends=('git')
checkdepends=('python-beautifulsoup4' 'python-mock' 'python-pytest-runner' 'python-pytest-timeout'
              'python-pytz')
provides=('pathod')
conflicts=('pathod')
replaces=('pathod')
source=("git+https://github.com/mitmproxy/mitmproxy.git#tag=v$pkgver"
        python3.6.patch)
sha256sums=('SKIP'
            'b34a7554198a53a0313c645aae0204e894a50ff0491a67d1f59c86443738b5a2')

prepare() {
  cd mitmproxy

  patch -p1 -i ../python3.6.patch

  # Let's remove all the upper bounds, use system certificate store and ssl.match_hostname
  sed -e '/certifi/d' \
      -e 's/, *<[0-9=.]*//' \
      -i setup.py
  sed -e '/import certifi/d' \
      -e 's|certifi.where()|"/etc/ssl/certs/ca-certificates.crt"|' \
      -i mitmproxy/net/tcp.py
}

check() {
  cd mitmproxy
  LC_CTYPE=en_US.UTF-8 python setup.py ptr
}
 
package() {
  cd mitmproxy
  python setup.py install --root="$pkgdir" -O1
}
