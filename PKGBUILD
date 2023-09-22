# Maintainer: xiota / aur.chaotic.cx
# Contributor: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

_gitname="thefuzz"
_pkgname="python-$_gitname"
pkgname="$_pkgname-git"
pkgver=0.20.1.r0.gccffad3
pkgrel=1
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
  python-fuzzywuzzy
)
conflicts=(
  python-fuzzywuzzy
)

if [ x"_pkgname" == x"$pkgname" ] ; then
  # normal package
  source=("$_gitname"::"git+$url#tag=$pkgver")
  sha256sums=(SKIP)
else
  # git package
  provides+=(
    "$_pkgname"
  )
  conflicts+=(
    "$_pkgname"
  )

  source=("$_gitname"::"git+$url")
  sha256sums=(SKIP)

  pkgver() {
    cd "$srcdir/$_gitname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  }
fi

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

  _pyver=$(
    python --version \
      | sed -E 's@^Python ([0-9]+\.[0-9]+)(\.[0-9]+)?$@\1@'
  )

  # provide fuzzywuzzy for backward compatibility
  ln -vsf "$_gitname" "$pkgdir/usr/lib/python$_pyver/site-packages/fuzzywuzzy"
}
