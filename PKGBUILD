# Maintainer: FFY00 <filipe.lains@gmail.com>
pkgname=mitmproxy-git
_pkgname=${pkgname%-git}
pkgver=5.0.0.dev.7f464b8
pkgrel=1
pkgdesc="An interactive TLS-capable intercepting HTTP proxy."
arch=('any')
url="https://mitmproxy.org/"
license=('MIT')
depends=('python-blinker' 'python-brotlipy' 'python-click' 'python-cryptography' 'python-h11'
	'python-h2' 'python-hyperframe' 'python-kaitaistruct' 'python-ldap3' 'python-passlib'
	'python-pyasn1' 'python-pyopenssl' 'python-pyparsing' 'python-pyperclip' 'python-requests'
	'python-ruamel-yaml' 'python-setuptools' 'python-sortedcontainers' 'python-tornado'
	'python-urwid' 'python-wsproto' 'python-asynctest' 'python-parver')
checkdepends=('python-beautifulsoup4' 'python-flask' 'python-pytest-runner' 'python-pytest-asyncio')
conflicts=('mitmproxy')
provides=('mitmproxy')
source=("git+https://github.com/mitmproxy/mitmproxy.git")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir"/$_pkgname
  #git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g;s/\.rc./rc/g'
  python -c "from mitmproxy import version ; print(version.get_dev_version())" | \
  	sed -e 's| .*commit |.|g' -e 's|)||g'
}


prepare() {
  cd "$srcdir"/$_pkgname

  sed -e '/certifi/d' \
      -e 's/, *<[0-9=.]*//' \
      -i setup.py
  sed -e '/import certifi/d' \
      -e 's|certifi.where()|"/etc/ssl/certs/ca-certificates.crt"|' \
      -i mitmproxy/net/tls.py
}

check() {
  cd "$srcdir"/$_pkgname
  # https://github.com/mitmproxy/mitmproxy/issues/2892
  python setup.py pytest
}

package() {
  cd "$srcdir"/$_pkgname
  python setup.py install --root="$pkgdir"

  install -dm 644 "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm 644 "$srcdir"/$_pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
