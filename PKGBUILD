# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>

pkgname=adflite-git
pkgver=20130304
pkgrel=3
pkgdesc="Library to handle (replay) of Agata Data Format"
url="http://www.fair-center.de/de/fuer-nutzer/experimente/nustar/newsview-nustar/article/agata.html"
arch=('x86_64')
options=('!libtool')
provides=("adflite")
license=('GPL3')
depends=('gcc-libs')
makedepends=('git')
_gitroot='agatagsi@lx-pool.gsi.de:git/adflite'
_gitname='adflite'

## If you plan to access the GSI machines you are supposed to know the password already.

build() {
  cd ${srcdir}

  if [ -d ${srcdir}/$_gitname ]; then
    cd $_gitname && git pull origin
    msg "The local files are up-to-date now."
  else
    git clone --depth 1 $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  if [ -d ${srcdir}/$_gitname-build ]; then
    rm -rf ${srcdir}/$_gitname-build
  fi

  cp -r ${srcdir}/$_gitname ${srcdir}/$_gitname-build || return 1
  cd ${srcdir}/$_gitname-build
  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd ${srcdir}/$_gitname-build
  make DESTDIR="$pkgdir/" install
}
