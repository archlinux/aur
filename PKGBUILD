# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-acme
pkgver=1.30.0
pkgrel=1
pkgdesc='ACME protocol implementation in Python'
arch=('any')
license=('Apache')
url='https://github.com/certbot/certbot'
depends=(
  'python-cryptography'
  'python-josepy'
  'python-pyopenssl'
  'python-pyrfc3339'
  'python-pytz'
  'python-requests'
  'python-requests-toolbelt'
)
makedepends=(
  'python-setuptools'
  'python-sphinx'
  'python-sphinx_rtd_theme'
)
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://pypi.io/packages/source/a/acme/acme-$pkgver.tar.gz")
sha512sums=('fb0320ebfef31afc2d29b72973a50390f67a4dcd3f96be4804b5bc13e09b71055a20f3b1da504fb4ebc300ae8871d244487d252e81029f6c23a01ff1a2c9485e')
b2sums=('3f129254df9db8d08c1bcbf371da5bda5e7cabd3f95e738cd28a7920ff50a2a263a4eb7cfe94d39bd05871f61a7f703d13baa3d6ed9d5d9db89c7b3a0ab95598')

prepare() {
  cd "acme-$pkgver"

  # nuke setuptools from orbit ^W install_requires
  sed \
    -e '/setuptools>=/d' \
    -i setup.py
}

build() {
  cd "acme-$pkgver"

  python setup.py build

  # create man page
  make -C docs man
}

check() {
  cd "acme-$pkgver"

  python -m pytest
}

package() {
  cd "acme-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1

  # man pages
  install -vDm644 -t "$pkgdir/usr/share/man/man1" docs/_build/man/*.1
}
