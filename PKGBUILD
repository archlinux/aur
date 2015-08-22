# Maintainer: Rafael Ferreira <rafael.f.f1@gmail.com>
# Contributor: Thomas Jost <schnouki@schnouki.net>
# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>

_name=gnome-commander
pkgname=$_name-git
pkgver=1.4.0.209.gd0350bb
pkgrel=1
pkgdesc="Graphical two-pane filemanager for GNOME"
arch=('i686' 'x86_64')
url="http://gcmd.github.io/"
license=('GPL')
depends=('libgnomeui' 'gnome-vfs' 'gconf' 'python2' 'libsm' 'libunique')
makedepends=('perl-xml-parser' 'gnome-doc-utils' 'intltool' 'gnome-common' 'git')
options=(!libtool)
install=$_name.install
provides=($_name)
conflicts=($_name)
source=(git://git.gnome.org/$_name)
md5sums=('SKIP')

pkgver() {
  cd $_name
  git describe --tags | sed -e 's/-/./g'
}

build() {
  cd $_name
  
  # Python 2 fix
  for f in doc/*/gnome-commander.xml; do
      sed -i 's:env python:env python2:' "$f"
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
