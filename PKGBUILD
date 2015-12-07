# $Id$
# Maintainer: Mirco Tischler <mt-ml@gmx.de>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=appstream-glib
pkgname=${_pkgname}-git
pkgver=appstream.glib.0.5.4.r5.g0f0c7a9
pkgrel=1
pkgdesc="Provides GObjects and helper methods to make it easy to read and write AppStream metadata (git version)"
arch=('i686' 'x86_64')
url="http://people.freedesktop.org/~hughsient/appstream-glib/"
license=('LGPL')
depends=('gtk3' 'libyaml' 'pacman' 'gcab')
makedepends=('intltool' 'git' 'gtk-doc' 'gobject-introspection')
provides=('appdata-tools' "appstream-glib=${pkgver}")
conflicts=('appdata-tools' 'appstream-glib')
replaces=('appdata-tools')
source=('git+https://github.com/hughsie/appstream-glib.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --always| sed 's|^appstrea_glib_||;s|\([^-].\)-|\1-r|;s|[-_]|\.|g'
}

build() {
  cd "$_pkgname"
  ./autogen.sh --prefix=/usr --enable-alpm

  #https://bugzilla.gnome.org/show_bug.cgi?id=655517
  #sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

check() {
  cd "$_pkgname"
  make -k check || :
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}
