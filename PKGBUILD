#Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=planner-git
pkgver=20110408
pkgrel=1
pkgdesc="Project management application"
arch=(i686 x86_64)
url="http://live.gnome.org/Planner/"
license=('GPL')
depends=('gtk-doc' 'libgnomecanvas' 'libgnomeui' 'pygobject-git')
makedepends=('git' 'gnome-common' 'intltool')
conflicts=('planner')
provides=('planner')
options=(makeflags !emptydirs)
_gitroot="git://git.gnome.org/planner"
_gitname="planner"
install=planner-git.install

build() {
  cd ${srcdir}/
    
    msg "Connecting to the GNOME GIT server...."
    if [[ -d ${srcdir}/${_gitname} ]] ; then
    	cd ${_gitname}
    	git pull origin
    	msg "The local files are updated..."
    else
    	git clone ${_gitroot}
    fi
    
    msg "GIT checkout done."

    msg "Starting make for: ${pkgname}"
    
    if [[ -d ${srcdir}/${_gitname}-build ]]; then
       msg "Cleaning the previous build directory..." 
       rm -rf ${srcdir}/${_gitname}-build
    fi

    git clone ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
    
    cd ${srcdir}/${_gitname}-build
    sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" tests/python/task-test.py
    msg "Starting build"
    export PYTHON=/usr/bin/python2
    export CFLAGS=-Wno-error
   ./autogen.sh --disable-update-mimedb --prefix=/usr || return 1
   make || return 1
}

package() {
  cd ${srcdir}/${_gitname}-build
  make DESTDIR="${pkgdir}" install || return 1
  msg "Updating mime database...."
}
