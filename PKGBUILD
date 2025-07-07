# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-ssort-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgver=0.15.0.r0.g2dd40ba
pkgrel=0
pkgdesc='Tool for automatically sorting python statements within a module (development version)'
arch=('any')
url="https://github.com/bwhmather/$_srcname"
license=('MIT')  # SPDX-License-Identifier: MIT
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)
depends=(
  'python>3.8'
  'python-pathspec'
)
source=("git+$url.git")
provides=("$_pkgname")
conflicts=("${provides[@]}")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname"

  _version=$(git describe --long --tags)
  printf 'VERSION = "%s"\n' "${_version%%-*}" > "src/$_srcname/_version.py"
  printf '%s\n' "$_version" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_srcname/src/$_srcname"

  sed -i -E 's/from ssort\.(.+) import/from .\1 import/' ./*.py
}

build() {
  cd "$_srcname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" README.rst
}

# eof
