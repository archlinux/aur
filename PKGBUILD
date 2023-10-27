# Maintainer: xiota / aur.chaotic.cx
# Contributor: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>
# Contributor: oldNo.7 <oldNo.7@archlinux.org>

_module="thefuzz"
_pkgname="python-$_module"
pkgname="$_pkgname-git"
pkgver=0.21.0.r0.g0b49e4a
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

if [ x"$pkgname" == x"$_pkgname" ] ; then
  # normal package
  _pkgsrc="$_module"
  source=("$_pkgsrc"::"git+$url.git#tag=${pkgver%%.r*}")
  sha256sums=('SKIP')

  pkgver() {
    echo "${pkgver%%.r*}"
  }
else
  # git package
  provides+=("$_pkgname")
  conflicts+=("$_pkgname")

  _pkgsrc="$_module"
  source=("$_pkgsrc"::"git+$url.git")
  sha256sums=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
  }
fi

provides+=('python-fuzzywuzzy')
conflicts+=('python-fuzzywuzzy')

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel
}

check() {
  cd "$_pkgsrc"
  pytest
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  local _pyver=$(
    python --version \
      | sed -E 's@^Python ([0-9]+\.[0-9]+)(\.[0-9]+)?$@\1@'
  )

  # provide fuzzywuzzy for backward compatibility
  ln -vsf "$_pkgsrc" "$pkgdir/usr/lib/python$_pyver/site-packages/fuzzywuzzy"
}
