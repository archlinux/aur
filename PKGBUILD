# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='ssort-git'
_pkgname="${pkgname/-git/}"
pkgver=0.15.0.r0.g2dd40ba
pkgrel=1
pkgdesc='Tool for automatically sorting python statements within a module (development version)'
arch=('any')
url='https://github.com/bwhmather/ssort'
license=('MIT')  # SPDX-License-Identifier: MIT
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)
depends=(
  'python>=3.9'
  'python-pathspec'
)
source=("git+$url.git")
provides=({,python-}"$_pkgname")
conflicts=("${provides[@]}")
replaces=('python-ssort-git')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  _version=$(git describe --long --tags)
  printf 'VERSION = "%s"\n' "${_version%%-*}" > "src/$_pkgname/_version.py"
  printf '%s\n' "$_version" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname/src/$_pkgname"

  sed -i -E 's/from ssort\.(.+) import/from .\1 import/' ./*.py
}

build() {
  cd "$_pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" README.rst
}

# eof
