# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-acme
pkgver=1.25.0
pkgrel=2
pkgdesc="ACME protocol implementation in Python"
arch=('any')
license=('Apache')
url="https://github.com/certbot/certbot"
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
sha512sums=('a7508fb9a71578509925fa5d0ce9994910e9dfbd92c07f25409bc6463bb23693a925a8cb946330c3c187da85dc083c0775193baa1c5ff1327ed8e1541507d877')
b2sums=('4c7245b41f303d781974e047be916c152ef794796e22075ccaef5622fabce091fc7821f706978b38d315b57a2361dac477009a5e4c54e6bc8a034de681f5266a')

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
