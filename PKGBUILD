# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-fastfeedparser-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgver=r32.1fefc30
pkgrel=2
pkgdesc='High performance RSS, Atom and RDF parser in Python (latest commit)'
arch=('any')
url='https://github.com/kagisearch/fastfeedparser'
license=('MIT')  # SPDX-License-Identifier: MIT
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
depends=(
  'python'
  'python-dateutil'
  'python-lxml'
  'python-parsedatetime'
)
source=("git+$url.git")
provides=("$_pkgname")
conflicts=("$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname"

  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
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
