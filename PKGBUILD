# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon 'ALSimon' Gilliot <simon@gilliot.fr>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>

pkgname=mitmproxy
pkgver=3.0.4
pkgrel=2
pkgdesc="SSL-capable man-in-the-middle HTTP proxy"
arch=('any')
url="https://mitmproxy.org/"
license=('GPL')
depends=('python-blinker' 'python-brotlipy' 'python-click' 'python-cryptography' 'python-h11'
         'python-h2' 'python-hyperframe' 'python-kaitaistruct' 'python-ldap3' 'python-passlib'
         'python-pyasn1' 'python-pyopenssl' 'python-pyparsing' 'python-pyperclip' 'python-requests'
         'python-ruamel-yaml' 'python-setuptools' 'python-sortedcontainers' 'python-tornado'
         'python-urwid' 'python-wsproto')
checkdepends=('python-beautifulsoup4' 'python-flask' 'python-pytest-runner')
provides=('pathod')
conflicts=('pathod')
replaces=('pathod')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mitmproxy/mitmproxy/archive/v$pkgver.tar.gz"
        "https://github.com/mitmproxy/mitmproxy/commit/19ceb6f49a791e51106d1605fb47ff0e3155b434.patch"
        "https://github.com/mitmproxy/mitmproxy/commit/9979be648750b6983b233ec3a8c3c644d8c332a1.patch")
sha512sums=('a89b0bee6997ce51d23483101755dae9f5300339d65e4975679df5c6b60ff9af94e655651321cd8e831666a04ec5cc24c7af647f3aab913524b6755b47f1f57b'
            '0dff8b425134b6c7dfbe40db039dbeeb5e45785bae55ec08056fd1d700cd1e1166bc2ef86d1378ceef81b6e93f9e094050daa04ed253cc3e33e31c7198f3f00d'
            'e40a8e29cfcb88adcdc6c84f7a4ccfc1e90a7576f62f9eaf87aeef4a8eda3d78023684742f2c4c85162509e49466393aa055b9a51c8049a5d9e48735a3410a94')

prepare() {
  cd mitmproxy-$pkgver

  # invalid syntax in pytest
  patch -p1 -i ../19ceb6f49a791e51106d1605fb47ff0e3155b434.patch
  # https://github.com/mitmproxy/mitmproxy/issues/3122
  patch -p1 -i ../9979be648750b6983b233ec3a8c3c644d8c332a1.patch

  # Let's remove all the upper bounds and use system certificate store
  sed -e '/certifi/d' \
      -e 's/, *<[0-9=.]*//' \
      -i setup.py
  sed -e '/import certifi/d' \
      -e 's|certifi.where()|"/etc/ssl/certs/ca-certificates.crt"|' \
      -i mitmproxy/net/tls.py
}

build() {
  cd mitmproxy-$pkgver
  python setup.py build
}

check() {
  cd mitmproxy-$pkgver
  # https://github.com/mitmproxy/mitmproxy/issues/2892
  python setup.py pytest
}

package() {
  cd mitmproxy-$pkgver
  python setup.py install --root="$pkgdir" -O1
}
