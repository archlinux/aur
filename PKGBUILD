# Maintainer:
# Contributor: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

# last commit before project was renamed "thefuzz"
# later commits break building
_commit=9e3d2fe0d8c1b195696d5fbcda78c371dd4a6b8f

_module="fuzzywuzzy"
_pkgname="python-$_module"
pkgname="$_pkgname-git"
pkgver=0.18.0.r3.g9e3d2fe
pkgrel=2
pkgdesc='Fuzzy string matching in Python'
url="https://github.com/seatgeek/fuzzywuzzy"
license=('GPL-2.0-only')
arch=(any)

depends=(
  'python'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-hypothesis'
  'python-pycodestyle'
  'python-pytest'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel
}

check() {
  cd "$_pkgsrc"

  # https://github.com/seatgeek/fuzzywuzzy/issues/284
  pytest --deselect test_fuzzywuzzy_pytest.py::test_process_warning
}

package() {
  depends+=(
    'python-levenshtein'
  )

  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
