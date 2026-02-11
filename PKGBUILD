# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-valkey-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgver=6.2.0rc1.r0.g9a3b547
pkgrel=2
pkgdesc='Valkey python client based on a fork of redis-py (development version)'
arch=('any')
url='https://github.com/valkey-io/valkey-py'
license=(
  'MIT'  # SPDX-License-Identifier: MIT (main package)
)
makedepends=(
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
depends=(
  'python>=3.11.3'
  'python-cryptography'
  'python-pyopenssl'
  'python-requests'
)
source=("git+$url.git")
provides=("$_pkgname")
conflicts=("${provides[@]}")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname-py"

  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_srcname-py"

  git clean -dfx
}

build() {
  cd "$_srcname-py"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcname-py"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md

  for _dir in doc licenses; do
    cd "$pkgdir/usr/share/$_dir" && ln -srf "$pkgname" "$_pkgname"
  done
}

# eof
