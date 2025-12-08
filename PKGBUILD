# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-deltachat-rpc-client-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgver=2.33.0.r9.g5902fe2cb
pkgrel=2
pkgdesc='Python client for Delta Chat core JSON-RPC interface (development version)'
arch=('any')
url='https://github.com/chatmail/core/tree/main/deltachat-rpc-client'
_url='https://github.com/chatmail/core'
license=('MPL-2.0')  # SPDX-License-Identifier: MPL-2.0
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
depends=(
  'python'
  'python-execnet'
  'python-pytest'
)
source=("git+$_url.git")
provides=("$_pkgname" "$_srcname")
conflicts=("${provides[@]}")
sha256sums=('SKIP')

pkgver() {
  cd "core/$_srcname"

  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "core/$_srcname"

  git clean -dfx
}

build() {
  cd "core/$_srcname"

  python -m build --wheel --no-isolation
}

package() {
  cd "core/$_srcname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    README.md
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/examples" \
    examples/*.py

  cd "$pkgdir/usr/share/doc" && ln -vsr "$pkgname" "$_pkgname"
}

# eof
