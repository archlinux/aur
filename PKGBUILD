# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-acme
pkgver=1.29.0
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
sha512sums=('2222a68897647dfa7ed5ed2124c23d8f8db4d9424a039fc1cf698af6ad16df59ca33d1b301606dacc9acf715f4994244a483c47cd7d21284221f17844e625bcc')
b2sums=('ebea99cea63226c93747dc3d1b8421a7be6b065796de6a1e38b0e648c3b6321e92cc35d4811f635ad2eb2c6267652a61f8e78cc46fb983757890552f75f9c3ba')

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
