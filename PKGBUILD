# shellcheck shell=bash
# -*- mode: sh -*-

# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='refurb'
pkgname="$_pkgname-git"
pkgdesc='A tool for refurbishing and modernizing Python codebases (development version)'
pkgver=2.3.1.r0.g0dbb127
pkgrel=1
url='https://github.com/dosisod/refurb'
arch=('any')
license=('GPL-3.0-or-later')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry-core'
  'python-wheel'
)
depends=('mypy' 'python')
provides=("$_pkgname")
conflicts=("python-$_pkgname" "${provides[@]}")
replaces=("python-$pkgname")
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

  # shellcheck disable=SC2043
  for _dir in doc; do
    test -d "$pkgdir/usr/share/$_dir" || continue
    cd "$pkgdir/usr/share/$_dir" && ln -srf "$pkgname" "$_pkgname"
  done
}

# eof
