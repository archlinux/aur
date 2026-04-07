# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=certbot-dns-ovh
pkgver=5.5.0
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
sha512sums=('532f7939a5d5af331755a9b572a698ffececc8a4394a30c5adc05694e8a3ea4e1f9087a5a8f6f1a973e738c46bca39da8f90e496aa2fa0cf31e58a1c63139179')
b2sums=('6ad84d30bc21e11624a45dcaab8bfefec091e461fbcbca1b03523d4b4c23e0545eadab795921df21de9f87d11ae21d9738755c17bdc06bfa6ecf5fe2fa40a0ce')

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
