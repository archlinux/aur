# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=certbot-dns-ovh
pkgver=5.3.0
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
sha512sums=('89dab355dc3bb6b86183dbcf573c761ae8ace52f4c925d69df4bfad3dbcb603579ad656588e1c22e4b3814ea874c2981322d57d79250fc9105f5085a0eea5b8e')
b2sums=('1479869351cc9784738633f18af3731596227cdf0a0841257a903528f7d15bd6744e333cabd1061b0b9b4ed48428640ebbc6f13a2ca64d268416a1d1dce46d34')

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
