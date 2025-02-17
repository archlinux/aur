# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=certbot-dns-ovh
pkgver=3.2.0
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
sha512sums=('b180c856eb5a69ef653ae55c74023eb7c7e3d92f972e71a9ed3aa401671a6fd966a66d7b37cbdddd2fa7fb452e35c7c98c3ce09b707ef58fe95e84f4dc808dd3')
b2sums=('159daf050b8715d4ca75ef8f82fbc6f630308b544bd2e3987d817b1b22efd03d3067a8aad1e8fea684330a5c56505dc091eed8dccceac3c401fc19408b0cffda')

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
