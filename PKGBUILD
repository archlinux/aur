# Maintainer: Ole Martin Ruud <dev@barskern.no>
# Contributer: Shane Stone <shanewstone at gmail>

pkgname=python-proselint
_name=${pkgname#python-}
pkgver=0.13.0
pkgrel=1
pkgdesc='A linter for prose'
arch=('any')
url="https://github.com/amperser/proselint"
license=('BSD')
depends=('python-click' 'python-future' 'python-six')
makedepends=(python-{build,installer,wheel})
checkdepends=('python-pytest')
conflicts=('proselint')
replaces=('proselint')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('6379c63fba0be8c5944c67ef4d3c0fd4ae4deb0076813531cddcdbc632bb254a4e213f88f07d96679465d740c1936a2b1502f852959a8ac9789ab1b983b8a0ef')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  # Due to a bug in poetry when there is a nesting of git directories
  # See https://github.com/pypa/build/issues/384 for more info
  GIT_CEILING_DIRECTORIES="$PWD/.." python -m build -wns
}

check() {
  cd "$_archive"

  pytest
}

package() {
  cd "$_archive"

  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
