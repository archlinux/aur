# shellcheck shell=bash
# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-can_ada-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
_srcdir="${_srcname}"
pkgdesc='Python bindings for Ada, a fast and WHATWG spec-compliant URL parser (development version)'
pkgver=3.0.0.r0.gb950b43
pkgrel=1
url="https://github.com/TkTech/$_srcname"
arch=('aarch64' 'x86_64')
license=('MIT')  # SPDX-License-Identifier: MIT
makedepends=(
  'git'
  'nanobind'
  'python-build'
  'python-installer'
  'python-scikit-build-core'
  'python-wheel'
)
depends=(
  'gcc-libs'
  'glibc'
  'python>=3.9'
)
provides=("$_pkgname")
conflicts=("${provides[@]}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcdir"

  git describe --long --tags \
  | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcdir"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcdir"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  for _dir in doc licenses; do
    cd "$pkgdir/usr/share/$_dir" && ln -vsr "$pkgname" "$_pkgname"
  done
}

# eof
