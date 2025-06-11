# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-acme
pkgver=4.1.0
pkgrel=1
pkgdesc='ACME protocol implementation in Python'
arch=('any')
license=('Apache-2.0')
url='https://github.com/certbot/certbot'
depends=(
  'python'
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
sha512sums=('37d8a9577c06b160c9756e4a1998b248874a9aae0ff3d50e2f42d8f79ec2b69ee1e4615a3b6daecbcea9270812bf71b18f209f6fc2835f5e5043154c957c5c1f')
b2sums=('0de2ba13a8132816ca14087e50d7ccc3329f245ce4b9d572de3f34a604b4701eb48ebf455fdb5032cdcb66880431dd90d6d1b4605fa7ab8ff681ee9fbb756ab3')

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
