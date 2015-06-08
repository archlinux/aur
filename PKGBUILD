# Maintainer: Georg Nagel <g.schlmm at gmail dot com>

pkgname=ola-git
pkgver=20150608
pkgrel=1
pkgdesc="The Open Lighting Architecture (OLA) provides a plugin framework for distributing DMX512 control signals on Mac and Linux"
arch=(i686 x86_64)
url="http://code.google.com/p/open-lighting/"
license=('LGPL2.1' 'GPL2')
provides=('ola')
makedepends=('git')
depends=('libmicrohttpd' 'cppunit' 'protobuf' 'python2-protobuf' 'python2')
optdepends=('liblo' 'avahi' 'libusb' 'libusb-compat' 'libftdi-compat' 'openslp')
conflicts=('ola')

_gitroot="https://github.com/OpenLightingProject/ola.git"
_gitname="ola"
# uncomment for 0.9.5
# _gitcommit="0.9.5"

build() {
  cd $srcdir
  msg "Connecting to GIT server...."
  
  if [ -d $_gitname ] ; then
    cd $_gitname && git checkout master && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  
  test -n "$_gitcommit" && cd "$srcdir/$_gitname" && git checkout $_gitcommit

  msg "GIT checkout done or server timeout"

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"

  cd "$srcdir/$_gitname-build"

  autoreconf -i
 
  # since protobuf isnt ported to python 3 we have to choose python 2 
  PYTHON=python2 ./configure --prefix=/usr --enable-python-libs --disable-unittests --disable-fatal-warnings

  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install || return 1
}
