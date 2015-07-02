# Maintainer: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: <arsenm2@rpi.edu>

_pkgname=gobject-introspection
pkgname="${_pkgname}-git"
_realver=1.41.4
pkgver=1.41.4.3.g3701b32
pkgrel=1
pkgdesc="GObject Introspection"
epoch=1
arch=('x86_64' 'i686')
license=('LGPL' 'GPL')
url="http://live.gnome.org/GObjectIntrospection/"
depends=("glib2-git" 'python2' 'python2-mako')
makedepends=('git' 'pkgconfig' 'autoconf' 'gtk-doc' 'gnome-common-git'
  'bison' 'cairo' 'mesa' 'flex')
provides=("gobject-introspection=${_realver}")
conflicts=('gobject-introspection' 'gobject-introspection-svn')
replaces=('gobject-introspection-svn')
options=(!makeflags docs !libtool strip debug)

_gitroot="git://git.gnome.org/gobject-introspection"

_gitname="gobject-introspection"
_gitref="master"

_fetch_git() {
  cd "$srcdir"

  if [ -d "$srcdir/$_gitname/.git" ]; then
    cd "$_gitname"
    msg "Reset current branch"
    git reset --hard HEAD
    git clean -fdx
    msg "Fetching branch $_gitref from $_gitroot..."
    git fetch --force --update-head-ok \
      "$_gitroot" "$_gitref:$_gitref" --
    msg "Checking out branch $_gitref..."
    git checkout "$_gitref" --
    git reset --hard "$_gitref"
    git clean -fdx
    msg "The local files are updated."
  else
    msg "Cloning branch $_gitref from $_gitroot to $_gitname..."
    git clone --single-branch --branch "$_gitref" \
      "$_gitroot" "$_gitname"
    cd "$_gitname"
  fi
  msg "GIT checkout done or server timeout"
}

pkgver() {
  local outfile=/dev/null
  [[ -e /dev/tty ]] && outfile=/dev/tty
  (_fetch_git &> ${outfile})
  cd "$srcdir/$_gitname"

  git describe | sed -e 's/^[^0-9]*//' -e 's/[-_]/./g'
}

build() {
  (_fetch_git)
  cd "$srcdir/$_gitname"

  msg "Starting build"
  export PYTHON=/usr/bin/python2
  ./autogen.sh --prefix=/usr --disable-static --enable-doctool
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install

  sed -i '1s|#!/usr/bin/env python$|&2|' \
    "$pkgdir"/usr/lib/gobject-introspection/giscanner/*.py
}
