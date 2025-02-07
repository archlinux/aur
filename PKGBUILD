# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-jh2-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgver=5.0.7.r0.g3d25ec6
pkgrel=2
pkgdesc='HTTP/2 State-Machine based protocol implementation (latest git commit)'
arch=('aarch64' 'x86_64')
url='https://github.com/jawah/h2'
license=('MIT')  # SPDX-License-Identifier: MIT
depends=(
  'gcc-libs'
  'glibc'
  'python>=3.7'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-maturin'
  'python-setuptools'
  'python-wheel'
)
source=("$_srcname::git+$url.git")
provides=("$_pkgname")
conflicts=("${provides[@]}")
sha256sums=('SKIP')
options=('lto')

pkgver() {
  cd "$_srcname"

  git describe --tags --long \
  | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    {CHANGELOG,README}.rst

  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" \
    LICENSE
}

# eof
