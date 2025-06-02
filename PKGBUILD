# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-qh3-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgver=1.5.2.r0.gb3ccc90
pkgrel=1
pkgdesc='Lightweight QUIC and HTTP/3 implementation in Python (development version)'
arch=('aarch64' 'x86_64')
url='https://github.com/jawah/qh3'
license=('BSD-3-Clause')  # SPDX-License-Identifier: BSD-3-Clause
depends=(
  'gcc-libs'
  'glibc'
  'python'
)
makedepends=(
  'cmake'
  'git'
  'python-build'
  'python-installer'
  'python-maturin'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'httpbin: needed to run the examples in the doc directory'
  'python-asgiref: needed to run the examples in the doc directory'
  'python-dnslib: needed to run the examples in the doc directory'
  'python-starlette: needed to run the examples in the doc directory'
  'python-uvloop: needed to run the examples in the doc directory'
  'python-wsproto: needed to run the examples in the doc directory'
)
provides=("$_pkgname")
conflicts=("${provides[@]}")
source=("$_srcname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname"

  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcname"

  git clean -dfx

  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" \
    LICENSE
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    {CHANGELOG,README}.rst SECURITY.md
  cp -vfa examples "$pkgdir/usr/share/doc/$pkgname/"
}

# eof
