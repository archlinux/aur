# $Id$
# Maintainer: Mirco Tischler <mt-ml@gmx.de>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=appstream-glib
pkgname=${_pkgname}-git
pkgver=0.6.4.r26.gb6d6c23
pkgrel=1
pkgdesc="Provides GObjects and helper methods to make it easy to read and write AppStream metadata (git version)"
arch=('i686' 'x86_64')
url="http://people.freedesktop.org/~hughsient/appstream-glib/"
license=('LGPL')
depends=('gtk3' 'libyaml' 'pacman' 'gcab' 'libstemmer' 'libsoup')
makedepends=('intltool' 'git' 'gtk-doc' 'gobject-introspection' 'autoconf-archive')
provides=('appdata-tools' "appstream-glib=${pkgver}")
conflicts=('appdata-tools' 'appstream-glib')
replaces=('appdata-tools')
source=('git+https://github.com/hughsie/appstream-glib.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --always| sed 's|^appstream_glib_||;s|\([^-].\)-|\1-r|;s|[-_]|\.|g'
}

build() {
  cd "$_pkgname"
  ./autogen.sh 	--prefix=/usr \
		--enable-alpm \
		--enable-stemmer
  #https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

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
