# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Simon 'ALSimon' Gilliot <simon@gilliot.fr>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>
# Contributor: Dobroslaw Kijowski

pkgname=mitmproxy
pkgver=5.2
pkgrel=3
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
              'python-pytest-asyncio' 'python-requests' 'python-hypothesis')
provides=('pathod')
conflicts=('pathod')
replaces=('pathod')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mitmproxy/mitmproxy/archive/v$pkgver.tar.gz"
        $pkgname-python3.9.patch::https://github.com/mhils/mitmproxy/commit/8e5e43de24c9bc93092b63efc67fbec029a9e7fe.patch
        $pkgname-openssl1.1.1h.patch::https://github.com/mitmproxy/mitmproxy/pull/4255.patch)
sha512sums=('6073c73b24618d6f64c4e99f199ebb6bc4157a3f83bfa7aff10a113f8dde823715e95bdf4202a1526dc0856d120858d32842b814327c3b98452b629fccb1790d'
            '95aa05d664501ac0ff6c00852f262d11aeaf33d3f1309d38307cb77b34fbbd72870637c2f230b7e065beade4785f5e8f4e89d74b5ade0f4ea73d51a0ff654bb5'
            'f1834ce0bcc1109add836f2af53420f09a9ff07aebd7b817e9096b5e1f2b13ad57e24cb035694f2ad5d2a8ebba68b1804a8ece60360bd3f34a45a7793aeb8851')

prepare() {
  cd $pkgname-$pkgver

  patch -p1 -i ../$pkgname-python3.9.patch
  patch -p1 -i ../$pkgname-openssl1.1.1h.patch || :

  # Let's remove all the upper bounds and use system ca-certificatescate store
  # urwid is pinned because the issue seems to affect Mac only
  sed -e '/certifi/d' \
      -e 's/, *<[0-9=.]*//' \
      -e 's/,!=2.1.0//' \
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
  python setup.py pytest --addopts "--deselect test/mitmproxy/test_version.py::test_get_version"
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" -O1

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
