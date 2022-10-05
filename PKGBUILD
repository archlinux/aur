# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=certbot
pkgver=1.31.0
pkgrel=1
pkgdesc="An ACME client"
arch=('any')
license=('Apache')
url="https://certbot.eff.org"
depends=(
  'ca-certificates'
  'python-acme'
  'python-configargparse'
  'python-configobj'
  'python-cryptography'
  'python-distro'
  'python-parsedatetime'
  'python-pyrfc3339'
  'python-pytz'
  'python-setuptools'
  'python-zope-component'
  'python-zope-interface'
)
makedepends=(
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
source=(
  "https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc}
  'tmpfiles.conf'
  'certbot-renew.service'
  'certbot-renew.timer'
)
sha512sums=('b1571285ed9fb98e55dd6a81e5d2b5347357712d2d902d1755f1f0a5ab8feb50bc8c72594f04f90bbf9449473a636cdd465afb7f635018944d41dfccd1c16065'
            'SKIP'
            'fbb7bb4591876aeb2e118c3f3fc8ff507b6a3127de0f921c689e1d74c70320b4f2b8bf05b488ec4f714259701f1ac54e64a9f6181475da6bd6d1e3da3a602217'
            'ad639f33201089d5531d1b1dcd163e2f85bd84a6a9aa233bb04f1f86b34a4f9afa4aed274a27cc89a0664150e80af31742d425923015d585b781a8b139cb8954'
            '471d371de385daf18f58a2e4eaed74f0d2d9931beb74ee28481ffb17ce4e4450752c135b920b6efd17a16f84f99fe38b69e6602e230ba09059f85390b08aaba1')
b2sums=('9541e6a7b4bdcdc18d335ca0521a4e06d97a019515eea59f6347efb2c0de4a7fee1a9141e4fd555254970da696f9b41f29ea7c5beb3a471050a101d3e673bca8'
        'SKIP'
        '7d2c26a9953d3b5a899053bdd7bd77051c67abe6480af2bfaaee06f20a399b0b4ccccc0af35cfe9e6d2b1fc833dbff928ba46771a9127720073dda29aef9a2e0'
        '773be7c45aaf84b79b260053dd4555be1b913238f680cf2c816e20d585db21c11ff41c985915ab0804bb3bc78af2e1e09133ed3b04e276e6379f63e9522064c1'
        'a75e09a662be6ce1bc533c39bea8ecfd6c0feb3f0066db854de701c1af71534bca750ef5b50826446708823564945aac887649225d15a347efd864dd1e1a8e81')
validpgpkeys=('148C30F6F7E429337A72D992B00B9CC82D7ADF2C'
              '1B41B758F9A78C7F444C20FA3E5B4152E3ADB1FD'
              'A2CFB51FA275A7286234E7B24D17C995CD9775F2'
              '20F201346BF8F3F455A73F9A780CC99432A28621'
              '86379B4F0AF371B50CD9E5FF3402831161D1D280'
              'F2871B4152AE13C49519111F447BF683AA3B26C3')

prepare() {
  cd "$pkgname-$pkgver"

  # nuke setuptools from orbit ^W install_requires
  sed \
    -e '/setuptools>=/d' \
    -i setup.py
}

build() {
  cd "$pkgname-$pkgver"

  python -m build --wheel --no-isolation

  # create man pages
  make -C docs man
}

check() {
  cd "$pkgname-$pkgver"

  python -m pytest
}

package() {
  # systemd integration
  install -vDm644 -t "$pkgdir/usr/lib/systemd/system" certbot-renew.*
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # sometimes Python packaging tools don't set the correct permissions...
  chmod 755 "$pkgdir"/usr/bin/*

  # man pages
  install -vDm644 -t "$pkgdir/usr/share/man/man1" docs/_build/man/*.1
  install -vDm644 -t "$pkgdir/usr/share/man/man7" docs/_build/man/*.7
}
