# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>

pkgname=python-blessings
_name=${pkgname#python-}
pkgver=1.7
pkgrel=14
pkgdesc="A thin, practical wrapper around terminal coloring, styling, and positioning"
url="https://github.com/erikrose/blessings"
arch=(any)
license=(MIT)
depends=(
  python
  python-six
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  'pytest.patch'  # https://github.com/erikrose/blessings/pull/167
)
sha256sums=(
  'ee1dc1524631c4fdb9e3a7f1776cbf82ae50cf1edf225d45bf274bebed0c6c36'
  '0703273dee07fda4112ff051a7fcbc6103eb2dc4d8c15c5328076f4765809b7c'
)

_archive="$_name-$pkgver"

prepare() {
  cd "$_archive" || exit

  patch -Np1 -i "$srcdir/pytest.patch"
}

build() {
  cd "$_archive" || exit

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive" || exit

  python -m pytest -s blessings/tests.py
}

package() {
  cd "$_archive" || exit

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
