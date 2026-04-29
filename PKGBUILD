# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='calcpy-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgdesc='Terminal calculator and advanced math solver using Python, IPython and SymPy (development version)'
pkgver=0.0.1.r277.gdf061bd
pkgrel=2
url="https://github.com/idanpa/$_srcname"
arch=('any')
license=('MIT')  # SPDX-License-Identifier: MIT
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)
depends=(
  'ipython'
  'python'
  'python-dateparser'
  'python-matplotlib'
  'python-numpy'
  'python-pyperclip'
  'python-requests'
  'python-sympy'
  'python-tzlocal'
)
replaces=('python-calcpy-git')
provides=({,python-}"$_pkgname" 'python-previewer')
conflicts=("${provides[@]}" "${replaces[@]}")
options=('!strip')
source=("git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$_srcname"

  sed -i "s/'pickleshare/#'pickleshare/g" setup.py
  sed -i "s/'antlr4-pyth/#'antlr4-pyth/g" setup.py
}

pkgver() {
  cd "$_srcname"

  # There are no tags yet,
  # so let's use number of revisions since beginning of history
  printf '0.0.1.r%s.g%s' \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
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
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  for _dir in doc licenses; do
    cd "$pkgdir/usr/share/$_dir" && ln -sr "$pkgname" "$_pkgname"
  done
}

# eof
