# shellcheck shell=bash
# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_srcname='textual-fspicker'
_pkgname="python-$_srcname"
pkgname="$_pkgname-git"
pkgdesc='A simple Textual filesystem picker dialog library (development version)'
pkgver=0.6.0.r18.g2a231e8
pkgrel=2
arch=('any')
url='https://github.com/davep/textual-fspicker'
license=('MIT')  # SPDX-License-Identifier: MIT
depends=(
  'python'
  'python-textual'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-uv-build'
  'python-wheel'
)
provides=("$_pkgname")
conflicts=("${provides[@]}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname"

  git describe --long --tags \
  | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_srcname"

  git clean -dfx
}

build() {
  cd "$_srcname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  for _dir in doc licenses; do
    cd "$pkgdir/usr/share/$_dir" && ln -srf "$pkgname" "$_pkgname"
  done
}

# eof
