# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-acme
pkgver=5.0.0
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
  python-pytz
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
sha512sums=('4a5cd2709290ae26f5c5a85a1f619cd39efcdd09297af69efd753d801b37ddd76c112c9cb6137d4631ad24defd806d37fc0b87995c35cae05873987b96ee0963')
b2sums=('5fd1ad0803c76b1449ba763bbebedc099191d51b01d6771e0b8c2a888bf0019bc92e585d44dfd8472157deb10ac07e1bcdc742d20822fd82e2f10fffacd08553')

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
