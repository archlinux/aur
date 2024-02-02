# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-unicode-slugify
_pkgname=${pkgname#python-}
pkgver=0.1.5
_commit=9306d3fd16763b841132f3be1b2065d8e03f7c90
pkgrel=2
pkgdesc="A slugifier that works in unicode"
arch=(any)
license=(BSD-3-Clause)
url="http://github.com/mozilla/unicode-slugify"
depends=(
  python
  python-six
  python-unidecode
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-nose)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz"
  "remove-failing-tests.patch"
)
sha256sums=(
  'cd563ac424ad67bb1bd73e212a0409166703163dcfa03fbf11c9d8dccbb1dde4'
  '97f560c92ff9608e13e37f57d2d5262f85b61488d507ed6b4bae7d7a9086dfc8'
)

_archive="$_pkgname-$_commit"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="$srcdir/remove-failing-tests.patch"
}

build() {
  cd "$_archive"

  # Hack to avoid building tests into thw wheel
  _tmpfile=$(mktemp)
  mv slugify/tests.py "$_tmpfile"
  python -m build --wheel --no-isolation
  mv "$_tmpfile" slugify/tests.py
}

check() {
  cd "$_archive"

  nosetests
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
