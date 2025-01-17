# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=certbot
pkgver=3.1.0
pkgrel=1
pkgdesc='An ACME client'
arch=('any')
license=('Apache-2.0')
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
_repo="github.com-certbot-certbot"
source=(
  "$_repo::git+https://github.com/certbot/certbot#tag=v$pkgver"
  'tmpfiles.conf'
  'certbot-renew.service'
  'certbot-renew.timer'
)
sha512sums=('4c43b5c44aed8f950250db5a210105e4910aa705b5d23af7edcdac51cd73c05f20724afce9da2d255f92bff0c74b1a6b583a13f19421b511e37e4058ad7b6852'
            'fbb7bb4591876aeb2e118c3f3fc8ff507b6a3127de0f921c689e1d74c70320b4f2b8bf05b488ec4f714259701f1ac54e64a9f6181475da6bd6d1e3da3a602217'
            'ad639f33201089d5531d1b1dcd163e2f85bd84a6a9aa233bb04f1f86b34a4f9afa4aed274a27cc89a0664150e80af31742d425923015d585b781a8b139cb8954'
            '471d371de385daf18f58a2e4eaed74f0d2d9931beb74ee28481ffb17ce4e4450752c135b920b6efd17a16f84f99fe38b69e6602e230ba09059f85390b08aaba1')
b2sums=('596a5cf9507c512a77d706cb6e5ae4aaa706876668dffb4e43091aa0ba88adaff8b1e2626b5956bec309ef8e55ad5cd70fba479fbe550fcb6afa7bce2eda1e2a'
        '7d2c26a9953d3b5a899053bdd7bd77051c67abe6480af2bfaaee06f20a399b0b4ccccc0af35cfe9e6d2b1fc833dbff928ba46771a9127720073dda29aef9a2e0'
        '773be7c45aaf84b79b260053dd4555be1b913238f680cf2c816e20d585db21c11ff41c985915ab0804bb3bc78af2e1e09133ed3b04e276e6379f63e9522064c1'
        'a75e09a662be6ce1bc533c39bea8ecfd6c0feb3f0066db854de701c1af71534bca750ef5b50826446708823564945aac887649225d15a347efd864dd1e1a8e81')

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
