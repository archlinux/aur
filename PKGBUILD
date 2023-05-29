# Maintainer:
# Contributor: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

# last commit before project was renamed "thefuzz"
# later commits break building
_commit=9e3d2fe0d8c1b195696d5fbcda78c371dd4a6b8f

_pkgname=python-fuzzywuzzy
pkgname=$_pkgname-git
pkgver=0.18.0.r3.g9e3d2fe
pkgrel=1
pkgdesc='Fuzzy string matching in Python'
arch=(any)
url="https://github.com/seatgeek/fuzzywuzzy"
license=('GPL2')

depends=(
  'python-levenshtein'
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

provides=(${_pkgname})
conflicts=(${provides[@]})

source=("$_pkgname"::"git+$url#commit=$_commit")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  python -m build --no-isolation --wheel
}

check() {
  cd "$srcdir/$_pkgname"
  # https://github.com/seatgeek/fuzzywuzzy/issues/284
  pytest --deselect test_fuzzywuzzy_pytest.py::test_process_warning
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
