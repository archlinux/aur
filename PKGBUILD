# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=certbot-dns-ovh
pkgver=3.1.0
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
  'python-wheel'
  'python-installer'
)
checkdepends=('python-pytest')
# git repository is used because certbot is a huge monorepo and it's easier to
# share the entire repository across all certbot related packages than a few
# hundred tarballs.
_repo='github.com-certbot-certbot'
source=("$_repo::git+https://github.com/certbot/certbot#tag=v$pkgver")
sha512sums=('4c43b5c44aed8f950250db5a210105e4910aa705b5d23af7edcdac51cd73c05f20724afce9da2d255f92bff0c74b1a6b583a13f19421b511e37e4058ad7b6852')
b2sums=('596a5cf9507c512a77d706cb6e5ae4aaa706876668dffb4e43091aa0ba88adaff8b1e2626b5956bec309ef8e55ad5cd70fba479fbe550fcb6afa7bce2eda1e2a')

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
