# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-acme
pkgver=3.0.0
pkgrel=1
pkgdesc='ACME protocol implementation in Python'
arch=('any')
license=('Apache-2.0')
url='https://github.com/certbot/certbot'
depends=(
  'python-cryptography'
  'python-josepy'
  'python-pyopenssl'
  'python-pyrfc3339'
  'python-pytz'
  'python-requests'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-sphinx'
  'python-sphinx_rtd_theme'
)
checkdepends=('python-pytest')
# git repository is used because certbot is a huge monorepo and it's easier to
# share the entire repository across all certbot related packages than a few
# hundred tarballs.
_repo="github.com-certbot-certbot"
source=("$_repo::git+https://github.com/certbot/certbot#tag=v$pkgver")
sha512sums=('dd38ca95992c19949ba9487442aeb57abe219c107b1cd58f775cf453d05b6d90da7fe88c8cdb976e58c2dab9c9c771fb7246df6d7d8aa1d606510b7174c56876')
b2sums=('17eec78e0fd80a69f11b1cff979b1b15322ca8a2f74cf6bfbb39dfd659b3d3b856f1b605973f143e8d90f9c622a10d1d7f341a94846804927a06ddecabfe4c6d')

prepare() {
  cd "$_repo/acme"

  # nuke setuptools from orbit ^W install_requires
  sed \
    -e '/setuptools>=/d' \
    -i setup.py
}

build() {
  cd "$_repo/acme"

  python -m build --wheel --no-isolation

  # create man page
  make -C docs man
}

check() {
  cd "$_repo/acme"

  python -m pytest
}

package() {
  cd "$_repo/acme"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # man pages
  install -vDm644 -t "$pkgdir/usr/share/man/man1" docs/_build/man/*.1
}
