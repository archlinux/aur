# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=certbot-dns-ovh
pkgver=5.1.0
pkgrel=1
pkgdesc='OVH DNS Authenticator plugin for Certbot'
arch=('any')
license=('Apache-2.0')
url='https://pypi.python.org/pypi/certbot-dns-ovh'
depends=(
  "certbot=$pkgver"
  "python-acme=$pkgver"
  'dns-lexicon'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
# git repository is used because certbot is a huge monorepo and it's easier to
# share the entire repository across all certbot related packages than a few
# hundred tarballs.
_repo='github.com-certbot-certbot'
source=("$_repo::git+https://github.com/certbot/certbot#tag=v$pkgver")
sha512sums=('c0b5488922c6e13d7d5bb2852130486f3d4d652b7bb16c69ac307dd6f1d09a28f988e26823d8e47ee2aa17ab3e213b3b18e0cc6bfc57f89ff7d894cbbbbf36cd')
b2sums=('547e18cd6df2229a06dc5c188d8f6fa62d3f672ba28d3b39ccf5b9a4a8a3a533f9d3565f439c1ec4e5b2e2d900c05c8ad30cd4d8ad88db07a96136eb0c814481')

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
