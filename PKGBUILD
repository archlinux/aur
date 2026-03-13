# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-calgebra-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
_srcdir="${_srcname}"
pkgver=0.10.8.r0.gbea36e1
pkgrel=1
pkgdesc='Python set() operations for calendar intervals (development version)'
arch=('any')
url="https://github.com/ashenfad/$_srcname"
license=('MIT')  # SPDX-License-Identifier: MIT
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)
depends=(
  'python'
  'python-dateutil'
  'python-sortedcontainers'
  'python-typing_extensions'
)
optdepends=(
  'python-gcsa: for working with Google Calendar'
  'python-icalendar: for working with iCalendar'
  'python-pandas: for converting iterables of Intervals into pandas DataFrames'
)
source=("git+$url.git")
provides=("$_pkgname")
conflicts=("${provides[@]}")
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

  local _site_packages='<VOID>'
  _site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')

  _dupes=(
    "$pkgdir$_site_packages/docs"
    "$pkgdir$_site_packages/$_srcname/docs"
    "$pkgdir$_site_packages/$_srcname/skills"
  )
  rm -rf "${_dupes[@]}"

  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    ./*.md docs/*.md
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE

  for _dir in doc licenses; do
    cd "$pkgdir/usr/share/$_dir" || continue
    ln -srf "$pkgname" "$_pkgname"
  done
}

# eof
