# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-acme
pkgver=1.31.0
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
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-sphinx'
  'python-sphinx_rtd_theme'
)
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://pypi.io/packages/source/a/acme/acme-$pkgver.tar.gz")
sha512sums=('a2bd5d564186bd72a8201be4a8036a1faac32a799d1e96193488cfd2e31d780261342f89eb17adfe88f9694c3a4573c883a8899ffb3fdf3cb815ed9039b07a63')
b2sums=('2b91c0360c7adf0715c7db036dc62ae3df16f8a7d43d2af585d28d5b87052c843208fe8034fdc82b4c4de63f5dd2f2c8315a3b9df28d062b9539671d6ab7171f')

prepare() {
  cd "acme-$pkgver"

  # nuke setuptools from orbit ^W install_requires
  sed \
    -e '/setuptools>=/d' \
    -i setup.py
}

build() {
  cd "acme-$pkgver"

  python -m build --wheel --no-isolation

  # create man page
  make -C docs man
}

check() {
  cd "acme-$pkgver"

  python -m pytest
}

package() {
  cd "acme-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # man pages
  install -vDm644 -t "$pkgdir/usr/share/man/man1" docs/_build/man/*.1
}
