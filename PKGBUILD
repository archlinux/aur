#! /bin/bash
# Contributor: Anton Shestakov <engored*ya.ru>
# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>

pkgname=desmume-jit-svn
pkgver=r5043
pkgrel=1
pkgdesc='Nintendo DS emulator, svn version with jit patch'
url='http://desmume.org/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('agg' 'gtkglext' 'libglade' 'libpcap' 'mesa' 'openal' 'sdl' 'soundtouch')
makedepends=('autoconf' 'automake' 'intltool' 'pkg-config' 'subversion')
conflicts=('desmume' 'desmume-sourceforge' 'desmume-svn')
provides=('desmume')
source=(svn://svn.code.sf.net/p/desmume/code/trunk
        enable-jit.patch
	glx_3Demu.patch)
install=desmume.install

pkgver() {
  cd trunk/desmume
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare () {
  cd trunk/desmume
  patch -Np0 < ../../enable-jit.patch
  patch -Np0 < ../../glx_3Demu.patch
}

build() {
  cd trunk/desmume
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --enable-wifi \
    --enable-openal \
    --enable-osmesa \
    --enable-hud \
    --enable-glade \
    --enable-debug
  make
}

package() {
  cd trunk/desmume
  make DESTDIR="$pkgdir" install
}

sha512sums=('SKIP'
            'f4d601f79b004aec502156fe500fc04dbdde489afc56251ee298694142f72629ef77bfdccd58df408fa6e45ee2da4e4707c6c13c08a13eb778c198f010b0fb4c'
            'ed48aaa9522e59c86d50f46989721e67a033ab8813515082842fc013d0641c073122d7e5a1480364955422f654b07c2a291ef9a6992a650c35f7037f90b975fe')
