# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Giorgio Lando <patroclo7@gmail.com>
# Contributor: Nicolas Quienot <niQo@aur>
# Contributor: Jesse Young <jesse.young@gmail.com>
# Contributor: Anton Eliasson <devel@antoneliasson.se>

pkgbase=python38-httplib2
pkgname=python38-httplib2
pkgver=0.21.0
pkgrel=2
pkgdesc='Comprehensive HTTP client library, supporting many features'
url='https://github.com/httplib2/httplib2'
license=('MIT')
arch=('any')
depends=('python38' 'ca-certificates')
makedepends=('python38-setuptools')
checkdepends=(
  'flake8'
  'python38-pytest-cov'
  'python38-pytest-forked'
  'python38-pytest-timeout'
  'python38-pytest-xdist'
  'python38-pytest-randomly'
  'python38-future'
  'python38-cryptography'
  'python38-six'
)
source=(
  "$pkgbase-$pkgver.tar.gz::https://github.com/httplib2/httplib2/archive/v$pkgver.tar.gz"
  'cert.patch'
)
sha512sums=('8269014f05f5e4b668c7dea8ae708b27a60b4216d712a93ab58b74f399ab5bc0dcdcd8c1411ccff587c7bdb6bc20917451ad969e5bef2d5c5262327cabe17bbb'
            '503719fb07b9ff1f06f252b73804787759139098dba990a7dcd9e9b3602f7271d2251e703993636b249b3597c9a240c721c536a4fe31526ec4ba9441f6c8da56')

prepare() {
  cd httplib2-$pkgver
  patch -p0 -i "$srcdir"/cert.patch
  sed -i 's/==/>=/' requirements-test.txt
}

build() {
  cd "$srcdir"/httplib2-$pkgver
  python3.8 setup.py build
}

check() {
  cd httplib2-$pkgver
  # test_client_cert_password_verified fails with cryptography 36 https://github.com/httplib2/httplib2/issues/221
  PYTHONPATH=build/lib pytest -k 'not test_client_cert_password_verified'
}

package() {
  cd httplib2-$pkgver
  python3.8 setup.py install -O1 --root="$pkgdir"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
