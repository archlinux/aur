# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Thomas Jost <schnouki@schnouki.net>
# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>

_name=gnome-commander
pkgname=$_name-git
pkgver=1.9.0.r18.09ef4307
pkgrel=1
pkgdesc="Graphical two-pane filemanager for GNOME"
arch=('x86_64')
url="http://gcmd.github.io/"
license=('GPL')
depends=('libgnomeui' 'gconf' 'python' 'libsm' 'libunique' 'gnome-vfs'
         'exiv2' 'taglib' 'chmlib' 'libgsf' 'poppler-glib')
makedepends=('perl-xml-parser' 'yelp-tools' 'git')
options=(!libtool)
provides=($_name)
conflicts=($_name)
source=(git+https://git.gnome.org/browse/$_name)
md5sums=('SKIP')

pkgver() {
  cd $_name

  _tag=$(git describe --abbrev=0)
  v=$(grep AC_INIT configure.ac | cut -d'[' -f3 | cut -d']' -f1)
  r="$(git rev-list --count $_tag..HEAD)"
  h="$(git rev-parse --short HEAD)"
  printf "$v.r$r.$h"
}

prepare() {
  cd $_name
  ./autogen.sh NOCONFIGURE=1
}

build() {
  cd $_name
  ./configure --prefix=/usr --libdir=/usr/lib --sysconfdir=/etc \
              --localstatedir=/var --enable-python
  make
}

package() {
  cd $_name

  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install
  install -d "$pkgdir/usr/share/gconf/schemas"
  gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/$_name.schemas" \
    --domain "$_name" "$pkgdir/etc/gconf/schemas/"*.schemas
  rm -rf "$pkgdir/etc/gconf/schemas/"
}
