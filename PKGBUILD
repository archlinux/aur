# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-acme
pkgver=1.28.0
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
sha512sums=('13a2d418fb2d0c1a339c005a7e2c188f51aae66073334209e2bd63af9addff1fec59603114a2285c6e61b5be0b8a6797d70509b274a03186812c0e5e1528d367')
b2sums=('425b8e01d91cf4420ec80af6aaa2cd7a1068d5ce4d5a95bd33853e359a1c5e04654b6790a493b6f83129aad32be335832c2a6237828e2e720f4b830ea82083cf')

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
