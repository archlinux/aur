# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-minotaur-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgdesc='A pythonic, asynchronous inotify interface (development version)'
pkgver=0.3.0.r0.g84628aa
pkgrel=1
url='https://github.com/giannitedesco/minotaur'
arch=('aarch64' 'x86_64')
license=('Apache-2.0')  # SPDX-License-Identifier: Apache-2.0
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
depends=(
  'glibc'
  'python'
)
provides=("$_pkgname")
conflicts=("${provides[@]}")
source=("$_srcname::git+$url.git")
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

  export PYTHONWARNINGS=ignore
  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  local _site_packages='<VOID>'
  _site_packages=$(
    python -c 'import site; print(site.getsitepackages()[0])'
  )
  rm -f "$pkgdir/$_site_packages/$_srcname/_inotify.c"

  cd "$pkgdir/usr/share/doc" && ln -sf "$pkgname" "$_pkgname"
}

# eof
