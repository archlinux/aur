# Maintainer: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: <arsenm2@rpi.edu>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>

_pkgname=gobject-introspection
pkgname="${_pkgname}-git"
pkgver=1.45.2.3354.fb91f7e
pkgrel=1
pkgdesc="GObject Introspection"
epoch=1
arch=('x86_64' 'i686')
license=('LGPL' 'GPL')
url="http://live.gnome.org/GObjectIntrospection/"
depends=("glib2-git" 'python2' 'python2-mako')
makedepends=('git' 'pkgconfig' 'autoconf' 'gtk-doc' 'gnome-common-git'
  'bison' 'cairo' 'mesa' 'flex')
provides=("gobject-introspection=${pkgver}" "gobject-introspection-runtime=${pkgver}")
conflicts=('gobject-introspection' 'gobject-introspection-svn' "gobject-introspection-runtime")
replaces=('gobject-introspection-svn')
options=(!makeflags docs !libtool strip debug)

source=("git+git://git.gnome.org/$_pkgname")
md5sums=("SKIP")

subver() {
  PREFIX="m4_define(gi_$1_version, "
  echo $(grep "$PREFIX" configure.ac | eval sed "'s/$PREFIX//'" | sed 's/)//')
}
 
pkgver() {
  cd "$srcdir/$_pkgname"
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  echo $(subver major).$(subver minor).$(subver micro).$revision.$hash
}

build() {
  cd "$srcdir/$_pkgname"
  export PYTHON=/usr/bin/python2
  ./autogen.sh --prefix=/usr --disable-static --enable-doctool
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install

  sed -i '1s|#!/usr/bin/env python$|&2|' \
    "$pkgdir"/usr/lib/gobject-introspection/giscanner/*.py
}
