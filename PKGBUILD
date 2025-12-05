# Maintainer:

_module="cxxheaderparser"
_pkgname="python-$_module"
pkgname="$_pkgname-git"
pkgver=1.6.1.r0.g3abac6d
pkgrel=1
pkgdesc="Parse C++ header files and generate a data structure representing the class"
url="https://github.com/robotpy/cxxheaderparser"
license=('BSD-3-Clause')
arch=('any')

depends=(
  'python'
)
makedepends=(
  'git'
  'python-build'
  'python-hatch-vcs'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)

provides=("$_pkgname=${pkgver%.g*}")
conflicts=("$_pkgname")

_pkgsrc="$_module"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
