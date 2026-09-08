# Maintainer: Yoann Laissus <yoann.laissus@gmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-acme-isolated
pkgver=5.8.0
pkgrel=1
pkgdesc='ACME protocol implementation in Python'
arch=(any)
license=(Apache-2.0)
url='https://github.com/certbot/certbot'
depends=(
  python
  python-cryptography
  python-josepy
  python-pyopenssl
  python-pyrfc3339
  python-requests
)
makedepends=(
  git
  python-build
  python-installer
  python-wheel
  python-setuptools
  python-sphinx
  python-sphinx_rtd_theme
)
checkdepends=(python-pytest)
# git repository is used because certbot is a huge monorepo and it's easier to
# share the entire repository across all certbot related packages than a few
# hundred tarballs.
_repo='github.com-certbot-certbot'
source=("$_repo::git+https://github.com/certbot/certbot#tag=v$pkgver")
sha512sums=('71d9a98365de26f7a8eeef40116f2afefdb4a539fa6d080024f1f5773299222974d79340d05fac83953aaffaa31ac169220a56001a8e3889b483365a65c8f78c')
b2sums=('969d082dfd6543e6c62e8374d9cead8889b62c3956b95055a39361423aeaf4f33b879b7b2958d1336b86d5d7d30190de7b0144f4f3e76bc305c73a2576b870e2')
provides=(python-acme)
conflicts=(python-acme)

build() {
  cd "$_repo/acme"

  python -m build --wheel --no-isolation

  # create man page
  make -C docs man
}

check() {
  cd "$_repo/acme"

  python -m pytest -v
}

package() {
  cd "$_repo/acme"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # man pages
  install -vDm644 -t "$pkgdir/usr/share/man/man1" docs/_build/man/*.1
}
