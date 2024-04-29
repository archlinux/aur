# Maintainer: László Várady <laszlo.varady93@gmail.com>

pkgname=openconnect-sso
pkgver=0.8.0
pkgrel=6
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
            '820cc200d62db90446f9102ddce2c2b166b5cc487e6ba0490ec3f62ad762bb31'
            '1a06f5ae5ba7e8204b2b975402f080e7e04364a2cf102d9c6e172a16f268f0ab')


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
