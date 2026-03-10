# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=certbot-dns-ovh
pkgver=5.4.0
pkgrel=1
pkgdesc='OVH DNS Authenticator plugin for Certbot'
arch=(any)
license=(Apache-2.0)
url='https://pypi.python.org/pypi/certbot-dns-ovh'
depends=(
  "certbot=$pkgver"
  "python-acme=$pkgver"
  dns-lexicon
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
# git repository is used because certbot is a huge monorepo and it's easier to
# share the entire repository across all certbot related packages than a few
# hundred tarballs.
_repo='github.com-certbot-certbot'
source=("$_repo::git+https://github.com/certbot/certbot#tag=v$pkgver")
sha512sums=('4e151c8a688de50fa7f934b20e4d96d70a5ae655bb1ab2f5d2cd5ed66861e1d1c20dc6a4117ff215110b54705bbe480a26e5f873185118e3936e83feee9ce67c')
b2sums=('3632786cb4ddb294eec8b0bbdb6e9eb3b62032687b51ff6652dc005600c89d8b647acdcfe128fa01d7050f90976e76a00a1c47992349015e4ef9a3a468222f41')

build() {
  cd "$_repo/$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_repo/$pkgname"

  # https://github.com/certbot/certbot/issues/9606
  pytest -v -W ignore::DeprecationWarning
}

package() {
  cd "$_repo/$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
