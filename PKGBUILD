# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-ultraplot-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgver=1.60.2.r12.g6ab74347
pkgrel=1
pkgdesc='A succint python wrapper for matplotlib (development version)'
arch=('any')
url='https://github.com/Ultraplot/UltraPlot'
license=('MIT')  # SPDX-License-Identifier: MIT (main package)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
depends=(
  'python>=3.12'
  'python-cycler'
  'python-matplotlib'
  'python-numpy'
  'python-packaging'
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

  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.{md,rst}
}

# eof
