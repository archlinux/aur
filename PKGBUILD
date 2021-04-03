# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=peasy
pkgname="${_pkgname}-git"
pkgver=v0.9.r7.g1756415
pkgrel=1
pkgdesc="A plugin for Geany  which allows to load other plugins written in Python or Lua (Git version)"
url="https://github.com/kugel-/peasy/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('libpeas' 'geany')
makedepends=('gobject-introspection' 'intltool' 'vala')
optdepends=('python: support plugins written in Python'
            'lua51: support plugins written in Lua')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/kugel-/peasy.git")
sha256sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"

  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  ./autogen.sh
  sed -i -e 's/@install_sh@/install/g' po/Makefile.in.in
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
