# Maintainer: xiota / aur.chaotic.cx
# Contributor: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>
# Contributor: oldNo.7 <oldNo.7@archlinux.org>

## links
# https://pypi.python.org/pypi/thefuzz

_module="thefuzz"
_pkgname="python-$_module"
pkgname="$_pkgname-git"
pkgver=0.22.1.r9.g1ba86f3
pkgrel=1
pkgdesc='Fuzzy string matching in Python'
url="https://github.com/seatgeek/thefuzz"
license=('MIT')
arch=('any')

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

provides=(
  "$_pkgname=${pkgver%%.r*}"
  "python-fuzzywuzzy=0.18.0"
)
conflicts=(
  "$_pkgname"
  "python-fuzzywuzzy"
)

_pkgsrc="$_module"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd "$_pkgsrc"
  pytest
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # provide fuzzywuzzy for backward compatibility
  local _sitepackages="$(python -c 'import site; print(site.getsitepackages()[0])')"
  ln -vsf "$_pkgsrc" "${pkgdir}${_sitepackages}/fuzzywuzzy"

  # license
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
