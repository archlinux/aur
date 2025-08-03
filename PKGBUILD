# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-fastfeedparser-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgver=0.4.1.r67.1f9f5c5
pkgrel=2
epoch=1
pkgdesc='High performance RSS, Atom and RDF parser in Python (development version)'
arch=('any')
url='https://github.com/kagisearch/fastfeedparser'
license=('MIT')  # SPDX-License-Identifier: MIT
makedepends=(
  'awk'
  'git'
  'python-build'
  'python-installer'
  'python-setuptools>=67.0'
  'python-wheel'
)
depends=(
  'python>=3.7'
  'python-brotli'
  'python-dateparser'
  'python-dateutil'
  'python-lxml'
)
source=("git+$url.git")
provides=("$_pkgname")
conflicts=("${provides[@]}")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname"

  _ver=$(awk '/^version = / { print $3 }' setup.cfg)
  test -n "$_ver" && printf '%s.' "$_ver"

  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_srcname"

  sed -i 's/"setuptools~=67\.0"/"setuptools>=67\.0"/g' pyproject.toml
}

build() {
  cd "$_srcname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}

# eof
