# shellcheck shell=bash
# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='aggregate6'
pkgname="$_pkgname-git"
pkgdesc='IPv4 and IPv6 prefix aggregation tool (development version)'
pkgver=1.0.15.r4.g9d513e3
pkgrel=1
url='https://github.com/job/aggregate6'
arch=('any')
license=('BSD-2-Clause')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)
depends=(
  'python'
  'python-py-radix'
)
provides=({,python-}"$_pkgname")
conflicts=("${provides[@]}")
options=('!strip')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags \
  | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  git clean -dfx
}

build() {
  cd "$_pkgname"

  export PYTHONWARNINGS=ignore
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/man/man7" ./*.7

  rm -rf "$pkgdir/usr/man"

  for _dir in doc licenses; do
    pushd "$pkgdir/usr/share/$_dir"
    ln -srf "$pkgname" "$_pkgname"
    popd
  done > /dev/null
}

# eof
