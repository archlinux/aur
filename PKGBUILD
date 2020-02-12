# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Simon 'ALSimon' Gilliot <simon@gilliot.fr>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>
# Contributor: Dobroslaw Kijowski

pkgname=mitmproxy
pkgver=5.0.0
pkgrel=1
pkgdesc='SSL-capable man-in-the-middle HTTP proxy'
arch=('any')
url='https://mitmproxy.org'
license=('MIT')
depends=('python-blinker' 'python-brotli' 'python-click' 'python-cryptography' 'python-flask'
         'python-h2' 'python-hyperframe' 'python-kaitaistruct' 'python-ldap3' 'python-passlib'
         'python-protobuf' 'python-pyasn1' 'python-pyopenssl' 'python-pyparsing' 'python-pyperclip'
         'python-ruamel-yaml' 'python-setuptools' 'python-sortedcontainers' 'python-tornado'
         'python-urwid' 'python-wsproto' 'python-publicsuffix2' 'python-zstandard')
checkdepends=('python-asynctest' 'python-beautifulsoup4' 'python-parver' 'python-pytest-runner'
              'python-pytest-asyncio' 'python-requests')
provides=('pathod')
conflicts=('pathod')
replaces=('pathod')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mitmproxy/mitmproxy/archive/v$pkgver.tar.gz")
sha512sums=('89de1e40cf7b78e04c575f8db2583c720c47492f6330e6a24819f27b580cd1fc1feb4c1b547de1213361d53ca08b16dae24d7fa9f3faa615fb9917769c1d10cb')

prepare() {
  cd $pkgname-$pkgver

  # Let's remove all the upper bounds and use system ca-certificatescate store
  sed -e '/certifi/d' \
      -e 's/, *<[0-9=.]*//' \
      -e 's/==/>=/' \
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
  # test/mitmproxy/proxy/test_server.py::*::test_tcp hangs: https://github.com/mitmproxy/mitmproxy/issues/3666
  # test/mitmproxy/net/test_tcp.py::* fails due to TLS 1.3
  python setup.py pytest --addopts "--deselect test/mitmproxy/proxy/test_server.py::TestHTTPS::test_tcp \
                                    --deselect test/mitmproxy/proxy/test_server.py::TestReverseSSL::test_tcp \
                                    --deselect test/mitmproxy/proxy/test_server.py::TestTransparentSSL::test_tcp \
                                    --deselect test/mitmproxy/proxy/test_server.py::TestUpstreamProxySSL::test_tcp \
                                    --deselect test/mitmproxy/net/test_tcp.py::TestServerCipherList::test_echo \
                                    --deselect test/mitmproxy/net/test_tcp.py::TestServerCurrentCipher::test_echo \
                                    --deselect test/mitmproxy/net/test_tcp.py::TestDHParams::test_dhparams"
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" -O1

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
