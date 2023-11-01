# Maintainer: xiota / aur.chaotic.cx
# Contributor: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>
# Contributor: oldNo.7 <oldNo.7@archlinux.org>

_module="thefuzz"
_pkgname="python-$_module"
pkgname="$_pkgname-git"
pkgver=0.22.1.r0.ga1a8cde
pkgrel=1
pkgdesc='Fuzzy string matching in Python'
arch=(any)
# https://pypi.python.org/pypi/thefuzz
url="https://github.com/seatgeek/thefuzz"
license=('MIT')

depends=(
  'python'
  'python-rapidfuzz'
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
  source+=("$_pkgsrc"::"git+$url.git#tag=${pkgver%%.r*}")
  sha256sums+=('SKIP')

  pkgver() {
    echo "${pkgver%%.r*}"
  }
else
  # git package
  provides+=("$_pkgname")
  conflicts+=("$_pkgname")

  _pkgsrc="$_module"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

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
  python -m installer --destdir="${pkgdir:?}" dist/*.whl

  local _sitepackages="$(python -c 'import site; print(site.getsitepackages()[0])')"

  # provide fuzzywuzzy for backward compatibility
  ln -vsf "$_pkgsrc" "${pkgdir:?}${_sitepackages:?}/fuzzywuzzy"

  # license
  install -Dm644 "LICENSE.txt" "${pkgdir:?}/usr/share/licenses/${pkgname:?}/LICENSE"
}
