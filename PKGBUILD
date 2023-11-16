# Maintainer:
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Thomas Hipp <thomashipp at gmail dot com>

_pkgname="cowsql"
pkgname="$_pkgname-git"
pkgver=1.15.4.r2.g6c91a1b
pkgrel=1
pkgdesc='An embeddable and replicated SQLite engine with high availability & automatic failover'
url="https://github.com/cowsql/cowsql"
license=('LGPL3')
arch=('x86_64')

depends=(
  'libuv'
  'raft'
  'sqlite'
)
makedepends=(
  'git'
  'readline'
  'tcl'
  'zlib'
)

options=(strip)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source+=("$_pkgsrc"::"git+$url.git")
sha256sums+=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _configure_options=(
    --prefix=/usr
    --enable-static=no
  )

  cd "$_pkgsrc"
  autoreconf -i
  ./configure "${_configure_options[@]}"
  make
}

check() {
  cd "$_pkgsrc"
  make check || true
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="${pkgdir:?}" install
}
