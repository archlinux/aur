# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon 'ALSimon' Gilliot <simon@gilliot.fr>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>

pkgname=mitmproxy
pkgver=2.0.2
pkgrel=2
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
checkdepends=('python-beautifulsoup4' 'python-flask' 'python-pytz' 'python-pytest-runner'
              'protobuf')
provides=('pathod')
conflicts=('pathod')
replaces=('pathod')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mitmproxy/mitmproxy/archive/v$pkgver.tar.gz"
        fix-test.patch kaitai-0.7.patch h2-3.0.patch)
sha512sums=('8a38340b3b1dd73c99c9e9b06a59bff78a23b2a851e1032ee0b7354ac46c834a3d005a67dc5238030570719eb5f842cb2a8ce64ffc7c5a01cbfa9a9511c08e66'
            '7cd8f430779df708e0a923bba43c29fcd94b1dc4e40b2cd7a5f878475911e12917e1cb130ffabc2d1f4a1dfe9883dfe6d9c2ff9cdcd5210a8a0480830d33b5a6'
            'a0fa449ddec32478123966845863f11e9dc3589e08be21e8fa6f5b89765a01fb03de689b84c82d5d44f84ad72ba7766587273fb4413a09950f06e388d57fb45d'
            '859147363b1686a042923c5df8481c7078327e9e3715993ce81b68b63002f8a8bd071a17ca080268c7a0d8211b1a2bbb64a8e78250778693b1fcb6a558d3ec46')

prepare() {
  cd mitmproxy-$pkgver

  # https://github.com/mitmproxy/mitmproxy/pull/2170
  patch -p1 -i ../fix-test.patch

  patch -p1 -i ../kaitai-0.7.patch

  patch -p1 -i ../h2-3.0.patch

  # Let's remove all the upper bounds and use system certificate store
  sed -e '/certifi/d' \
      -e 's/, *<[0-9=.]*//' \
      -i setup.py
  sed -e '/import certifi/d' \
      -e 's|certifi.where()|"/etc/ssl/certs/ca-certificates.crt"|' \
      -i mitmproxy/net/tcp.py
}

check() {
  cd mitmproxy-$pkgver
  LC_CTYPE=en_US.UTF-8 python setup.py pytest
}

package() {
  cd mitmproxy-$pkgver
  python setup.py install --root="$pkgdir" -O1
}
