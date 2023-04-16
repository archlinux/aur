# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Shane Stone <shanewstone at gmail>

pkgname=proselint
_name=${pkgname#python-}
pkgver=0.13.0
pkgrel=3
pkgdesc='A linter for prose'
arch=(any)
url="https://github.com/amperser/proselint"
license=(BSD)
makedepends=(
  python-build
  python-installer
  python-poetry
  python-wheel
)
checkdepends=(python-pytest)
depends=(
  python-click
  python-future
)
conflicts=(python-proselint)
replaces=(python-proselint)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('31804ad7ee90a3e250337c2c6171b6ef7bbdb0a720ac0edff98c6b774001fa503db48597fda84eb108fe97ce943ef45caa53b160084087cbf2b1b564e84fb7cb')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  # Due to a bug in poetry when there is a nesting of git directories
  # See https://github.com/pypa/build/issues/384 for more info
  GIT_CEILING_DIRECTORIES="$PWD/.." python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  python -m pytest
}

package() {
  cd "$_archive"

  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
