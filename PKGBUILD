# Maintainer: Rafael Ferreira <rafael.f.f1@gmail.com>
# Contributor: Thomas Jost <schnouki@schnouki.net>
# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>

_name=gnome-commander
pkgname=$_name-git
pkgver=1.4.0.24.g7ee4460
pkgrel=1
pkgdesc="A graphical two-pane filemanager for GNOME"
arch=('i686' 'x86_64')
url="http://gcmd.github.io/"
license=('GPL')
depends=('libgnomeui' 'exiv2' 'taglib' 'libgsf' 'python2' 'poppler' 'libunique')
makedepends=('perlxml' 'gnome-doc-utils' 'chmlib' 'gnome-common' 'intltool')
options=(!libtool)
install=$_name.install
provides=($_name)
conflicts=($_name)
source=(git://git.gnome.org/$_name)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  git describe --tags | sed -e 's/-/./g'
}

build() {
  cd "$srcdir/$_name"
  
  # python2 fix
  for file in doc/*/gnome-commander.xml; do
    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
  done
  export PYTHON=python2

  export CFLAGS="$CFLAGS -fno-strict-aliasing"
  ./autogen.sh --prefix=/usr --libdir=/usr/lib --sysconfdir=/etc \
    --localstatedir=/var --disable-scrollkeeper --enable-python

  make
}

package() {
  cd "$srcdir/$_name"

  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir"/usr/share/gconf/schemas
  gconf-merge-schema "$pkgdir"/usr/share/gconf/schemas/${pkgname}.schemas \
    "$pkgdir"/etc/gconf/schemas/*.schemas
  rm -f "$pkgdir"/etc/gconf/schemas/*.schemas
}
