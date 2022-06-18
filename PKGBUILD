# Maintainer: László Várady <laszlo.varady93@gmail.com>

pkgname=openconnect-sso
pkgver=0.8.0
pkgrel=2
pkgdesc="Wrapper script for OpenConnect supporting Azure AD (SAMLv2) authentication"
arch=('any')
url="https://github.com/vlaci/openconnect-sso"
license=('GPL3')
depends=('python' 'python-pyqt5' 'python-pyqtwebengine' 'python-attrs' 'python-colorama'
         'python-keyring' 'python-lxml' 'python-prompt_toolkit' 'python-xdg' 'python-requests'
         'python-structlog' 'python-toml' 'python-pysocks' 'sudo' 'openconnect')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-asyncio')
optdepends=()
source=("https://github.com/vlaci/openconnect-sso/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
        'relax-pyxdg-version-constraints.patch')
sha256sums=('a7bde0a8dd35d7bab3c66f28b420c343c270a7ee45e98e04bfa6ecc6958f5c5b'
            'a74a597fe78299917a276d743b446d90e5677a234824952d2383582e4cdce63c')

prepare() {
  cd "$pkgname-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/relax-pyxdg-version-constraints.patch"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  pytest || /usr/bin/true # pytest-httpserver
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
