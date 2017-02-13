# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Thomas Jost <schnouki@schnouki.net>
# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>

_name=gnome-commander
pkgname=$_name-git
pkgver=1.7.0.r27.ef2fd20
pkgrel=1
pkgdesc="Graphical two-pane filemanager for GNOME"
arch=('i686' 'x86_64')
url="http://gcmd.github.io/"
license=('GPL')
depends=('libgnomeui' 'gnome-vfs-nosmb' 'gconf' 'python2' 'libsm' 'libunique')
makedepends=('perl-xml-parser' 'gnome-doc-utils' 'intltool' 'gnome-common' 'git')
options=(!libtool)
provides=($_name)
conflicts=($_name)
source=(git+https://git.gnome.org/browse/$_name)
md5sums=('SKIP')

pkgver() {
  cd $_name

  # git describe --tags | sed -e 's/-/./g'
  _tag=$(git describe --abbrev=0)
  v=$(grep AC_INIT configure.ac | awk -F',' '{printf $2}' | sed 's/ //')
  r="$(git rev-list --count $_tag..HEAD)"
  h="$(git rev-parse --short HEAD)"
  printf "$v.r$r.$h"
}

build() {
  cd $_name
  
  # Python 2 fix
  for f in doc/*/gnome-commander.xml; do
      sed -i 's:env python$:env python2:' "$f"
  done
  export PYTHON=python2 #force python2 on configure procedures

  ./autogen.sh --prefix=/usr --libdir=/usr/lib --sysconfdir=/etc \
              --localstatedir=/var --disable-scrollkeeper --enable-python

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
