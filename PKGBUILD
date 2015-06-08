# $Id$
# Maintainer: Realex
# Based on cinnamon-desktop PKGBUILD

_pkgname=cinnamon-desktop
pkgname=${_pkgname}-git
pkgver=174.15af3e9
pkgrel=1
pkgdesc="Library with common API for various Cinnamon modules"
arch=(i686 x86_64)
license=(GPL LGPL)
depends=('gtk3' 'libxkbfile')
makedepends=('intltool' 'gobject-introspection' 'gnome-common' 'git' 'patch')
url="https://github.com/linuxmint/cinnamon-desktop"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!emptydirs')
source=("git+https://github.com/linuxmint/${_pkgname}.git"
	"fix_build.patch")
sha512sums=("SKIP"
	"6a58333fc2bd637c637aeb3823fa50c0f60492022927df086257d47a4e39c9afaa12196da60623c817b1fccb5d9c3a2b819df7904e930055452ebe9e5ba8f326")
install="${pkgname}.install"

pkgver() {
  cd ${srcdir}/${_pkgname}
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd ${srcdir}/cinnamon-desktop
  patch -Np1 -i ../fix_build.patch
}

build() {
  cd ${srcdir}/${_pkgname}
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib/${_pkgname} --disable-static
  make
}

package() {
  cd ${srcdir}/${_pkgname}
  make DESTDIR="$pkgdir" install
}
