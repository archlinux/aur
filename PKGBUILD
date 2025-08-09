# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-acme
pkgver=4.2.0
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
sha512sums=('197f5e36f2a2c1edef2a4e36040a85e4a246d2ab097176e47f85a060989052fb0927646ee0780e8ccd95d8b77e72afdc302c557755f2fad600f6f90d5c25a87d')
b2sums=('36963c10967fa6744f66e4af811119193da61a592e018a5b7fcaa8e7ed43860344b9ba29e42272f33743863b00352eac0e6f51b836d467562fabe495331c6179')

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
