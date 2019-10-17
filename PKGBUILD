# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Simon 'ALSimon' Gilliot <simon@gilliot.fr>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>
# Contributor: Dobroslaw Kijowski

pkgname=mitmproxy
pkgver=4.0.4
pkgrel=6
pkgdesc='SSL-capable man-in-the-middle HTTP proxy'
arch=('any')
url='https://mitmproxy.org'
license=('MIT')
depends=('python-blinker' 'python-brotlipy' 'python-click' 'python-cryptography' 'python-h2'
         'python-hyperframe' 'python-kaitaistruct' 'python-ldap3' 'python-passlib' 'python-protobuf'
         'python-pyasn1' 'python-pyopenssl' 'python-pyparsing' 'python-pyperclip'
         'python-ruamel-yaml' 'python-setuptools' 'python-sortedcontainers' 'python-flask'
         'python-urwid' 'python-wsproto')
checkdepends=('python-asynctest' 'python-beautifulsoup4' 'python-tornado' 'python-parver'
              'python-pytest-runner' 'python-pytest-asyncio' 'python-requests')
provides=('pathod')
conflicts=('pathod')
replaces=('pathod')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mitmproxy/mitmproxy/archive/v$pkgver.tar.gz"
        'https://github.com/mitmproxy/mitmproxy/commit/70777a1b6ed64af9cafcdef223a8a260ecc96864.patch'
        'move-onboardingapp-from-tornado-to-flask-backport.patch')
sha512sums=('e08ea8b1c75a95b822c463625509037bbc8a979161cacaa1f0185f98df8d6d7e5400925365dbbe70d18751251b1005824f739a8cd035c0389f7b4aea562adfb3'
            '8e88f36e6ca8e5a245617ecd419dcaf7ee890a88283bd71d6b866e11e9ee51128d643c5c1d764b105d580fe44bc26ad8212ee676e46403d48bebe4c080552e2a'
            'ad48bfbe4ae53b0b40f386aaaff43e012ab9978ad74ae325096c565ca0a329d8257f9c0913a9266c5bb5969f0f6a1414eb9c9053a9ed2c7d38422e8c75fa6d07')

prepare() {
  cd $pkgname-$pkgver

  # Let's remove all the upper bounds and use system ca-certificatescate store
  sed -e '/certifi/d' \
      -e 's/, *<[0-9=.]*//' \
      -i setup.py
  sed -e '/import certifi/d' \
      -e 's|certifi.where()|"/etc/ssl/certs/ca-certificates.crt"|' \
      -i mitmproxy/net/tls.py

  # Fix wsproto
  sed '176,188d' \
      -i ../70777a1b6ed64af9cafcdef223a8a260ecc96864.patch
  patch -p1 < ../70777a1b6ed64af9cafcdef223a8a260ecc96864.patch

  # Fix outdated tornado
  patch -p1 < ../move-onboardingapp-from-tornado-to-flask-backport.patch
  sed -i '/tornado/d' setup.py

  # Remove failing tests
  rm  test/mitmproxy/addons/test_readfile.py \
      test/mitmproxy/net/{test_tcp.py,test_tls.py} \
      test/mitmproxy/proxy/test_server.py \
      test/examples/test_xss_scanner.py
}

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

check() {
  cd $pkgname-$pkgver
  python setup.py pytest
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" -O1

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
