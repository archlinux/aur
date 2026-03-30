# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-deltachat-rpc-client-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgdesc='Python client for Delta Chat core JSON-RPC interface (development version)'
pkgver=2.48.0.r0.g24b21c058
pkgrel=1
_url='https://github.com/chatmail/core'
url="$_url/tree/main/deltachat-rpc-client"
arch=('any')
license=('MPL-2.0')  # SPDX-License-Identifier: MPL-2.0
checkdepends=(
  'python-execnet'
  'python-pytest'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
depends=('python')
provides=("$_pkgname")
conflicts=("${provides[@]}")
options=('!strip')
source=("git+$_url.git")
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

  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    README.md
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/examples" \
    examples/*.py

  cd "$pkgdir/usr/share/doc" && ln -fsr "$pkgname" "$_pkgname"
}

# eof
