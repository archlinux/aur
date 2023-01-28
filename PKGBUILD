# Contributor: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

_pkgname=python-fuzzywuzzy
pkgname=$_pkgname-git
pkgver=0.18.0.r3.g9e3d2fe
# this is the last commit before project was renamed "thefuzz"
_commit=9e3d2fe0d8c1b195696d5fbcda78c371dd4a6b8f
pkgrel=1
pkgdesc='Fuzzy string matching in Python'
arch=(any)
_url="https://pypi.python.org/pypi/fuzzywuzzy"
url="https://github.com/seatgeek/fuzzywuzzy"
license=('GPL2')
depends=('python')
provides=(${_pkgname})
conflicts=(${provides[@]})
optdepends=(
  'python-levenshtein: provides a 4-10x speedup in string matching'
)
makedepends=(
  'git'
  'python-setuptools'
)
checkdepends=(
  'python-hypothesis'
  'python-levenshtein'
  'python-pycodestyle'
  'python-pytest'
)
source=("$_pkgname"::"git+$url#commit=$_commit")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

check() {
  cd "$srcdir/$_pkgname"
  # https://github.com/seatgeek/fuzzywuzzy/issues/284
  pytest --deselect test_fuzzywuzzy_pytest.py::test_process_warning
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
}
