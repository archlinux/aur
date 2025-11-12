# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-minotaur-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgver=0.3.0.r0.g84628aa
pkgrel=1
pkgdesc='A pythonic, asynchronous inotify interface (development version)'
arch=('aarch64' 'x86_64')
url='https://github.com/giannitedesco/minotaur'
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

  local _site_packages='<VOID>'
  _site_packages=$(
    python -c 'import site; print(site.getsitepackages()[0])'
  )
  rm -vf "$pkgdir/$_site_packages/$_srcname/_inotify.c"

  install -vDm0644 -t "$pkgname/usr/share/doc/$pkgname" README.md
}

# eof
