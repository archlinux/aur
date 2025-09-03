# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=certbot
pkgver=5.0.0
pkgrel=1
pkgdesc='An ACME client'
arch=(any)
license=(Apache-2.0)
url='https://certbot.eff.org'
depends=(
  ca-certificates
  python
  "python-acme=$pkgver"
  python-configargparse
  python-configobj
  python-cryptography
  python-distro
  python-parsedatetime
  python-pyrfc3339
  python-pytz
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
  python-sphinx
  python-sphinx_rtd_theme
)
checkdepends=(python-pytest)
optdepends=(
  'certbot-apache: Apache plugin for Let’s Encrypt client'
  'certbot-nginx: Nginx plugin for Let’s Encrypt client'
)
replaces=(letsencrypt)
# git repository is used because certbot is a huge monorepo and it's easier to
# share the entire repository across all certbot related packages than a few
# hundred tarballs.
_repo='github.com-certbot-certbot'
source=(
  "$_repo::git+https://github.com/certbot/certbot#tag=v$pkgver"
  tmpfiles.conf
  certbot-renew.service
  certbot-renew.timer
)
sha512sums=('4a5cd2709290ae26f5c5a85a1f619cd39efcdd09297af69efd753d801b37ddd76c112c9cb6137d4631ad24defd806d37fc0b87995c35cae05873987b96ee0963'
            'fbb7bb4591876aeb2e118c3f3fc8ff507b6a3127de0f921c689e1d74c70320b4f2b8bf05b488ec4f714259701f1ac54e64a9f6181475da6bd6d1e3da3a602217'
            'ad639f33201089d5531d1b1dcd163e2f85bd84a6a9aa233bb04f1f86b34a4f9afa4aed274a27cc89a0664150e80af31742d425923015d585b781a8b139cb8954'
            '471d371de385daf18f58a2e4eaed74f0d2d9931beb74ee28481ffb17ce4e4450752c135b920b6efd17a16f84f99fe38b69e6602e230ba09059f85390b08aaba1')
b2sums=('5fd1ad0803c76b1449ba763bbebedc099191d51b01d6771e0b8c2a888bf0019bc92e585d44dfd8472157deb10ac07e1bcdc742d20822fd82e2f10fffacd08553'
        '7d2c26a9953d3b5a899053bdd7bd77051c67abe6480af2bfaaee06f20a399b0b4ccccc0af35cfe9e6d2b1fc833dbff928ba46771a9127720073dda29aef9a2e0'
        '773be7c45aaf84b79b260053dd4555be1b913238f680cf2c816e20d585db21c11ff41c985915ab0804bb3bc78af2e1e09133ed3b04e276e6379f63e9522064c1'
        'a75e09a662be6ce1bc533c39bea8ecfd6c0feb3f0066db854de701c1af71534bca750ef5b50826446708823564945aac887649225d15a347efd864dd1e1a8e81')

build() {
  cd "$_repo/$pkgname"

  python -m build --wheel --no-isolation

  # create man pages
  make -C docs man
}

check() {
  cd "$_repo/$pkgname"

  # install to temporary directory
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install$site_packages"

  # https://github.com/certbot/certbot/issues/9606
  python \
    -m pytest \
    -W ignore::DeprecationWarning \
    --import-mode=importlib \
    src/certbot
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
