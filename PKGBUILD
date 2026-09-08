# Maintainer: Yoann Laissus <yoann.laissus@gmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=certbot-dns-ovh-isolated
_reponame="certbot-dns-ovh"
pkgver=5.8.0
pkgrel=1
pkgdesc='OVH DNS Authenticator plugin for Certbot - version with isolated dns-lexicon to avoid conflict with python-lexicon'
arch=(any)
license=(Apache-2.0)
url='https://pypi.python.org/pypi/certbot-dns-ovh'
depends=(
  "certbot-isolated=$pkgver"
  "python-acme-isolated=$pkgver"
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
# git repository is used because certbot is a huge monorepo and it's easier to
# share the entire repository across all certbot related packages than a few
# hundred tarballs.
_repo='github.com-certbot-certbot'
source=("$_repo::git+https://github.com/certbot/certbot#tag=v$pkgver")
sha512sums=('71d9a98365de26f7a8eeef40116f2afefdb4a539fa6d080024f1f5773299222974d79340d05fac83953aaffaa31ac169220a56001a8e3889b483365a65c8f78c')
b2sums=('969d082dfd6543e6c62e8374d9cead8889b62c3956b95055a39361423aeaf4f33b879b7b2958d1336b86d5d7d30190de7b0144f4f3e76bc305c73a2576b870e2')
provides=(certbot-dns-ovh)
conflicts=(certbot-dns-ovh)

build() {
  cd "$_repo/$_reponame"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_repo/$_reponame"

  # https://github.com/certbot/certbot/issues/9606
  pytest -v -W ignore::DeprecationWarning
}

package() {
  cd "$_repo/$_reponame"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
