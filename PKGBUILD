# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-piou-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
_srcdir="${_srcname}"
pkgver=0.22.0.r0.g3c6c768
pkgrel=1
pkgdesc='A CLI tool to build rich text command-line interfaces with type validation (development version)'
arch=('any')
url="https://github.com/Andarius/$_srcname"
license=('MIT')  # SPDX-License-Identifier: MIT
makedepends=(
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  #'python-poetry'
  'python-wheel'
)
depends=(
  'python>=3.10'
  'python-rich'
  'python-typing_extensions'
)
source=("git+$url.git")
provides=("$_pkgname")
conflicts=("${provides[@]}")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcdir"

  git describe --long --tags \
  | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcdir"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcdir"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    README.md
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/examples" \
    examples/*.py
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE

  for _dir in doc licenses; do
    cd "$pkgdir/usr/share/$_dir" && ln -vsrf "$pkgname" "$_pkgname"
  done
}

# eof
