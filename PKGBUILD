# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=certbot-dns-ovh
pkgver=2.3.0
pkgrel=2
pkgdesc="OVH DNS Authenticator plugin for Certbot"
arch=('any')
license=('Apache')
url="https://pypi.python.org/pypi/$pkgname"
depends=(
  "certbot=$pkgver"
  "python-acme=$pkgver"
  'dns-lexicon'
)
makedepends=(
  'python-build'
  'python-wheel'
  'python-installer'
)
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc})
validpgpkeys=('148C30F6F7E429337A72D992B00B9CC82D7ADF2C'
              '1B41B758F9A78C7F444C20FA3E5B4152E3ADB1FD'
              'A2CFB51FA275A7286234E7B24D17C995CD9775F2'
              '86379B4F0AF371B50CD9E5FF3402831161D1D280'
              '20F201346BF8F3F455A73F9A780CC99432A28621'
              'F2871B4152AE13C49519111F447BF683AA3B26C3')
sha512sums=('714ef631ada1f574c67b1919c73a081a0cb548368fce041df1cb56efd138af4b1a6000da81f2ed09119001bf0ce9f32736f40a5a485a2905dd448ea320957a6c'
            'SKIP')
b2sums=('14ac7f33ee9f5c66e61be946882c5d5bac7ca6215607000800cf0cb46d45af39772169b045f0282d3918fee547177e4fdbbc93f76b9bfa7622f17ed17c341175'
        'SKIP')

prepare() {
  cd "$pkgname-$pkgver"

  # nuke setuptools from orbit ^W install_requires
  sed \
    -e '/setuptools>=/d' \
    -i setup.py
}

build() {
  cd "$pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"

  python -m pytest
}

package() {
  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
