# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Thomas Jost <schnouki@schnouki.net>
# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>

_name=gnome-commander
pkgname=$_name-git
pkgver=1.11.0.r311.8f02c9bf
pkgrel=1
pkgdesc="Graphical two-pane filemanager for GNOME"
arch=('x86_64')
url="https://gcmd.github.io"
license=('GPL')
depends=('libgnomeui' 'libunique3' 'taglib' 'poppler-glib' 'libgsf' 'exiv2' 'chmlib')
makedepends=('yelp-tools' 'git')
options=(!libtool)
provides=($_name)
conflicts=($_name)
source=(git+https://gitlab.gnome.org/GNOME/$_name)
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
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_name
  ./configure --prefix=/usr --libdir=/usr/lib --sysconfdir=/etc \
              --localstatedir=/var \
              --with-help-dir=/usr/share/doc/$pkgname
  make CXXFLAGS="$CXXFLAGS -Wno-error"
}

package() {
  cd $_name
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install
}
