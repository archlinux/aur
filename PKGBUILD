# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=certbot-dns-ovh
pkgver=2.6.0
pkgrel=1
pkgdesc='OVH DNS Authenticator plugin for Certbot'
arch=('any')
license=('Apache')
url='https://pypi.python.org/pypi/certbot-dns-ovh'
depends=(
  "certbot=$pkgver"
  "python-acme=$pkgver"
  'dns-lexicon'
)
makedepends=(
  'git'
  'python-build'
  'python-wheel'
  'python-installer'
)
checkdepends=('python-pytest')
# git repository is used because certbot is a huge monorepo and it's easier to
# share the entire repository across all certbot related packages than a few
# hundred tarballs.
_commit='013621d04ed26377cf6616448b21a4c050683719'
_repo='github.com-certbot-certbot'
source=("$_repo::git+https://github.com/certbot/certbot#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$_repo"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$_repo/$pkgname"

  # nuke setuptools from orbit ^W install_requires
  sed \
    -e '/setuptools>=/d' \
    -i setup.py
}

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
