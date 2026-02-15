# shellcheck shell=bash
# -*- sh -*-

# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-ultraplot-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgdesc='A succint python wrapper for matplotlib (development version)'
pkgver=1.71.0.r115.ga591d9c4
pkgrel=1
url='https://github.com/Ultraplot/UltraPlot'
arch=('any')
license=('MIT')  # SPDX-License-Identifier: MIT (main package)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools-scm'
  'python-wheel'
)
depends=(
  'python'
  'python-cycler'
  'python-matplotlib'
  'python-numpy'
)
optdepends=(
  'python-cartopy: matplotlib support for visualisation'
  'python-icecream: for sweet and creamy print debugging'
  'python-networkx: for working with complex networks'
  'python-seaborn: for visualisation of scientific data'
  'python-xarray: for N-D labeled arrays and datasets'
)
source=("$_srcname::git+$url.git")
provides=("$_pkgname")
conflicts=("${provides[@]}")
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

  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.{md,rst}
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt

  for _dir in doc licenses; do
    cd "$pkgdir/usr/share/$_dir" && ln -srf "$pkgname" "$_pkgname"
  done
}

# eof
