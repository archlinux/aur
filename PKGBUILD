# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-acme
pkgver=5.2.1
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
sha512sums=('1569fcc0b47988682ce5997b070ce5f84508f180ea01cbf96ba5cd1a1887d819aed3f800b8d87143a4bb5238d53b5deb9371ecb716083fd0318377ff903b3d9a')
b2sums=('9c8e86dba44a1dfdd7272847da22eaa955b69dbfb905d44f003e460ff16daa284c3a7bb97c7bb82e7015bbdbb141f2467c0b7e57de8b3ef658d7492d90248d2e')

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
