# Maintainer:
# Contributor: oldNo.7 <oldNo.7@archlinux.org>

_gitname="thefuzz"
_pkgname="python-$_gitname"
pkgname="$_pkgname"
pkgver=0.19.0
pkgrel=3
pkgdesc='Fuzzy string matching in Python'
arch=(any)
# https://pypi.python.org/pypi/thefuzz
url="https://github.com/seatgeek/thefuzz"
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

provides=(
  "$_pkgname"
  python-fuzzywuzzy
)
conflicts=(${provides[@]})

source=("$_gitname"::"git+$url#tag=$pkgver")
sha256sums=(SKIP)

build() {
  cd "$srcdir/$_gitname"
  python -m build --no-isolation --wheel
}

check() {
  cd "$srcdir/$_gitname"
  pytest
}

package() {
  cd "$srcdir/$_gitname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  _pyver=$(python --version | sed -E 's@^Python\ ([0-9]+\.[0-9]+)(\.[0-9]+)?$@\1@')

  # provide fuzzywuzzy for backward compatibility
  ln -sf "$_gitname" "$pkgdir/usr/lib/python$_pyver/site-packages/fuzzywuzzy"
}
