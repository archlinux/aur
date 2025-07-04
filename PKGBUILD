# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-valkey-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgver=6.1.1b2.r0.g46bb06e
pkgrel=3
pkgdesc='Valkey Python client based on a fork of redis-py (development version)'
arch=('any')
url='https://github.com/valkey-io/valkey-py'
license=(
  'MIT'  # SPDX-License-Identifier: MIT (main package)
)
makedepends=(
  'git'
  'python-build'
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

  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
}

# eof
