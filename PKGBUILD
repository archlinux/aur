# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-bsky-bridge-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgdesc='Python module for the Bluesky social network API (development version)'
pkgver=1.1.0.r1.gc29372f
pkgrel=1
url='https://github.com/0xExal/bsky-bridge'
arch=('any')
license=('MIT')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)
depends=(
  'python>=3.9'
  'python-pillow'
  'python-requests'
)
provides=("$_pkgname")
conflicts=("${provides[@]}")
options=('!strip')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname"

  git describe --tags --long \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcname"

  export PYTHONWARNINGS=ignore
  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" README{,.es-ES}.md

  for _dir in doc licenses; do
    pushd "$pkgdir/usr/share/$_dir"
    ln -srf "$pkgname" "$_pkgname"
    popd
  done > /dev/null
}

# eof
