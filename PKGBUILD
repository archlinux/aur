# shellcheck shell=bash
# -*- sh -*-

# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-reals-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgdesc='A lightweight Python library for arithmetic with real numbers (development version)'
pkgver=0.0.6.r1.g276399b
pkgrel=1
url='https://github.com/rubenvannieuwpoort/reals'
arch=('any')
license=('MIT')  # SPDX-License-Identifier: MIT (main package)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
depends=(
  'python'
)
provides=("$_pkgname")
conflicts=("${provides[@]}")
source=("$_srcname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname"

  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
