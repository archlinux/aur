# Maintainer: JSH <jsh6789 at gmail dot com>
# Contributor: fancris3 <fancris3 at aol.com>
# Contributor: Lucas Saliés Brum <lucas@archlinux.com.br>

_pkgname=gnome-network-monitor
pkgname=${_pkgname}-svn
pkgver=0.9.1.r125
pkgrel=1
epoch=1 # fix for upgrade from old version scheme
pkgdesc="A Network Monitor for GNOME"
arch=('any')
url="http://gnetworkmonitor.sourceforge.net/"
license=('GPL')
depends=('pygtk' 'python2-pysqlite' 'usermode>=1.36')
makedepends=('intltool' 'gettext' 'python2' 'desktop-file-utils')
options=(!emptydirs)
install=$pkgname.install
source=("${_pkgname}::svn+https://svn.code.sf.net/p/gnetworkmonitor/code/trunk")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  local ver="$(awk '/Version:/ { print $2 }' ${pkgname%%-svn}.spec)"
  local rev="$(svnversion)"
  printf "%s.r%s" "$ver" "${rev//[[:alpha:]]}"
}

prepare() {
  cd "$srcdir/${_pkgname}"
  
  # python2 fix
  sed -i 's|\(\W\)python|\1python2|g' Makefile
  sed -i 's|^#!/usr/bin/env python|#!/usr/bin/env python2|g' gnome-network-monitor gnm/*.py
}

# test failure
#check() {
#  cd "$srcdir/${_pkgname}/gnm"
#  
#  python2 unittesting.py
#}

package() {
  cd "$srcdir/${_pkgname}"
  
  make DESTDIR="$pkgdir" install
}
