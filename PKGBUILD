# $Id$
# Maintainer: Eric Bélanger <eric@archlinux.org>

_pkgname=gpac
pkgname=$_pkgname-git
pkgver=0.5.2.r2397.gc77fdae
pkgrel=1
epoch=1
pkgdesc="A multimedia framework based on the MPEG-4 Systems standard (git version)"
arch=('i686' 'x86_64')
url="http://gpac.sourceforge.net"
license=('LGPL')
depends=('ffmpeg' 'glu' 'libxv')
makedepends=('git' 'jack' 'a52dec' 'freetype2' 'faad2' 'libmad' 'mesa' 'sdl2')
optdepends=('jack: for jack support'
	    'a52dec: for A52 support'
            'faad2: for AAC support'
	    'libmad: for mp3 support'
	    'sdl2: for sdl support')
options=('staticlibs' '!makeflags')
conflicts=('gpac')
source=(
    git://github.com/gpac/gpac.git
    'ssl3.patch'
)
sha256sums=('SKIP'
            'f5391273c9b77283469362f02a31e65f8ce8c80343d80c5b0b0c019068831a41')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd ${_pkgname}

  patch -i ../ssl3.patch -Np1
}

build() {
  cd ${_pkgname}
  ./configure --prefix=/usr --mandir=/usr/share/man --X11-path=/usr --use-js=no
  make
}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" install install-lib
}
