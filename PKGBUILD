# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-textcase-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
_srcdir="${_srcname}"
pkgdesc='Feature-rich Python text case conversion library (development version)'
pkgver=0.4.5.r57.gb2c93c6
pkgrel=1
url="https://github.com/zobweyt/$_srcname"
install="$_pkgname.install"
arch=('any')
license=('GPL-3.0-or-later')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)
depends=('python')
provides=("$_pkgname")
conflicts=("${provides[@]}")
options=('!strip')
source=("git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$_srcdir"

  git clean -dfx
}

pkgver() {
  cd "$_srcdir"

  git describe --long --tags \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcdir"

  export PYTHONWARNINGS=ignore
  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcdir"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  cd "$pkgdir/usr/share/doc" && ln -sf "$pkgname" "$_pkgname"
}

# eof
