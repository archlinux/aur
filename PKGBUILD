# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon 'ALSimon' Gilliot <simon@gilliot.fr>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>

pkgname=mitmproxy
pkgver=2.0.1
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
checkdepends=('python-beautifulsoup4' 'python-flask' 'python-pytz' 'python-pytest-runner'
              'protobuf')
provides=('pathod')
conflicts=('pathod')
replaces=('pathod')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mitmproxy/mitmproxy/archive/v$pkgver.tar.gz"
        fix-test.patch)
sha256sums=('b0ccc49924762ea78290d62c463be8c041f1837f9005f583ad09c47122547e9d'
            'f9fc3e3732ba1867b3a0befc7c15c52ddd6b32723fc348c42c1eae546d021f1f')

prepare() {
  cd mitmproxy-$pkgver

  # https://github.com/mitmproxy/mitmproxy/pull/2170
  patch -p1 -i ../fix-test.patch

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
