# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=certbot-dns-ovh
pkgver=5.3.1
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
sha512sums=('dffae74b31d5c4f31112948c65d4503ac90021099aba0efc56c701c2deb846f29f19d1ea9e7509f79277e26c66d0df968e6b9bc6e72221c238566fc5c480d1a9')
b2sums=('bd038c82b529f18ec964c9a4f640d1183a3dbf65ae8e9d4d39974d755a06e4ecc5385735d08e0793105b6267733f133b63480b2c9c7859f28a2cac56233ec639')

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
