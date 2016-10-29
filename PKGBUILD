# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon 'ALSimon' Gilliot <simon@gilliot.fr>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>

pkgname=mitmproxy-py3-git
pkgver=0.19.5628
pkgrel=1
pkgdesc="SSL-capable man-in-the-middle HTTP proxy"
arch=('any')
url="http://mitmproxy.org/"
license=('GPL')
depends=('python-blinker' 'python-click' 'python-configargparse' 'python-construct'
         'python-cryptography' 'python-flask' 'python-h2' 'python-hpack'
         'python-html2text' 'python-hyperframe' 'python-lxml' 'python-pillow'
         'python-passlib' 'python-pyasn1' 'python-pyopenssl' 'python-pyparsing'
         'python-pyperclip' 'python-requests' 'python-tornado'
         'python-urwid' 'python-watchdog' 'python-brotlipy' 'python-cssutils'
		 'python-jsbeautifier' 'python-sortedcontainers' 'python-editorconfig')
optdepends=('python-protobuf: Contentviews - Extended content decoding'
            'python-pyamf: Contentviews - Decodes AMF files')
makedepends=('git')
checkdepends=('python-beautifulsoup4' 'python-harparser' 'python-mock'
              'python-pytest-runner' 'python-pytest-timeout')
provides=('python-libmproxy' 'python-netlib' 'pathod')
conflicts=('python-libmproxy' 'python-netlib' 'pathod')
replaces=('python-libmproxy' 'python-netlib' 'pathod')
source=("$pkgname::git+https://github.com/mitmproxy/mitmproxy.git")
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	echo "$(python setup.py --version).$(git rev-list --count HEAD)"
}

prepare() {
  cd $pkgname

  sed -i 's/length_field/lengthfield/' mitmproxy/contrib/tls/_constructs.py

  # Let's remove all the upper bounds, use system certificate store and ssl.match_hostname
  sed -e '/certifi/d' \
      -e '/backports.ssl_match_hostname/d' \
      -e 's/, *<[0-9=.]*//' \
      -i setup.py
  sed -e '/import certifi/d' \
      -e 's|certifi.where()|"/etc/ssl/certs/ca-certificates.crt"|' \
      -e 's/from backports import ssl_match_hostname/import ssl as ssl_match_hostname/' \
      -i mitmproxy/net/tcp.py
}

check() {
  cd $pkgname
  python setup.py ptr
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir" -O1
}
