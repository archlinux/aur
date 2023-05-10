# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=certbot
pkgver=2.6.0
pkgrel=1
pkgdesc='An ACME client'
arch=('any')
license=('Apache')
url='https://certbot.eff.org'
depends=(
  'ca-certificates'
  "python-acme=$pkgver"
  'python-configargparse'
  'python-configobj'
  'python-cryptography'
  'python-distro'
  'python-parsedatetime'
  'python-pyrfc3339'
  'python-pytz'
  'python-setuptools'
)
makedepends=(
  'git'
  'python-build'
  'python-wheel'
  'python-installer'
  'python-sphinx'
  'python-sphinx_rtd_theme'
)
checkdepends=('python-pytest')
optdepends=(
  'certbot-apache: Apache plugin for Let’s Encrypt client'
  'certbot-nginx: Nginx plugin for Let’s Encrypt client'
)
replaces=('letsencrypt')
# git repository is used because certbot is a huge monorepo and it's easier to
# share the entire repository across all certbot related packages than a few
# hundred tarballs.
_commit='013621d04ed26377cf6616448b21a4c050683719'
_repo="github.com-certbot-certbot"
source=(
  "$_repo::git+https://github.com/certbot/certbot#commit=$_commit"
  'tmpfiles.conf'
  'certbot-renew.service'
  'certbot-renew.timer'
)
b2sums=('SKIP'
        '7d2c26a9953d3b5a899053bdd7bd77051c67abe6480af2bfaaee06f20a399b0b4ccccc0af35cfe9e6d2b1fc833dbff928ba46771a9127720073dda29aef9a2e0'
        '773be7c45aaf84b79b260053dd4555be1b913238f680cf2c816e20d585db21c11ff41c985915ab0804bb3bc78af2e1e09133ed3b04e276e6379f63e9522064c1'
        'a75e09a662be6ce1bc533c39bea8ecfd6c0feb3f0066db854de701c1af71534bca750ef5b50826446708823564945aac887649225d15a347efd864dd1e1a8e81')

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

  # create man pages
  make -C docs man
}

check() {
  cd "$_repo/$pkgname"

  # https://github.com/certbot/certbot/issues/9606
  python -m pytest -W ignore::DeprecationWarning
}

package() {
  # systemd integration
  install -vDm644 -t "$pkgdir/usr/lib/systemd/system" certbot-renew.*
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  cd "$_repo/$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # sometimes Python packaging tools don't set the correct permissions...
  chmod 755 "$pkgdir"/usr/bin/*

  # man pages
  install -vDm644 -t "$pkgdir/usr/share/man/man1" docs/_build/man/*.1
  install -vDm644 -t "$pkgdir/usr/share/man/man7" docs/_build/man/*.7
}
