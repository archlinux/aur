# Maintainer: László Várady <laszlo.varady93@gmail.com>

pkgname=openconnect-sso
pkgver=0.8.0
pkgrel=5
pkgdesc="Wrapper script for OpenConnect supporting Azure AD (SAMLv2) authentication"
arch=('any')
url="https://github.com/vlaci/openconnect-sso"
license=('GPL3')
depends=('python' 'python-pyqt5' 'python-pyqtwebengine' 'python-attrs' 'python-colorama'
         'python-keyring' 'python-lxml' 'python-prompt_toolkit' 'python-pyxdg' 'python-requests'
         'python-structlog' 'python-toml' 'python-pysocks' 'python-jaraco.classes' 'sudo' 'openconnect')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-asyncio')
optdepends=()
source=("https://github.com/vlaci/openconnect-sso/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
        'relax-pyxdg-version-constraints.patch'
        'relax-keyring-version-constraints.patch')
sha256sums=('a7bde0a8dd35d7bab3c66f28b420c343c270a7ee45e98e04bfa6ecc6958f5c5b'
            'a74a597fe78299917a276d743b446d90e5677a234824952d2383582e4cdce63c'
            'cb723f0e6d72338a893e40dcb186859e25c5f90c2fee7d933532082ea493c1ff')

prepare() {
  cd "$pkgname-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/relax-pyxdg-version-constraints.patch"
  patch --forward --strip=1 --input="${srcdir}/relax-keyring-version-constraints.patch"
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
