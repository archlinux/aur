# Maintainer:
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Thomas Hipp <thomashipp at gmail dot com>

_pkgname="cowsql"
pkgname="$_pkgname-git"
pkgver=1.15.3.r0.ga1d49d0
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

if [ x"$pkgname" == x"$_pkgname" ] ; then
  # normal package
  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git#tag=v${pkgver%%.r*}")
  sha256sums+=('SKIP')

  pkgver() {
    echo "${pkgver%%.r*}"
  }
else
  # git package
  provides=("$_pkgname")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
  }
fi

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
