# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-niquests-git'
pkgdesc='Simple, yet elegant, Python HTTP library: a drop-in replacement for python-requests (development version)'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
_srcdir="${_srcname/-/.}"
pkgver=3.21.3.r1.gd326c469
pkgrel=1
url='https://github.com/jawah/niquests'
arch=('any')
license=('Apache-2.0')
makedepends=(
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
depends=(
  'python>=3.7'
  'python-charset-normalizer'
  'python-urllib3-future'
  'python-wassima'
)
optdepends=(
  'python-orjson: for speedups'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
options=('!strip')
sha256sums=('SKIP')

pkgver() {
  cd "$_srcdir"

  git describe --tags --long \
   | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcdir"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcdir"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    ./*.md

  for _dir in doc licenses; do
    cd "$pkgdir/usr/share/$_dir" && ln -sr "$pkgname" "$_pkgname"
  done >/dev/null
}

# eof
