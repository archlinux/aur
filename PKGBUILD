# Maintainer: Francois Rigaut <frigaut at gmail dot com>

pkgname=yorick-z-git
pkgver=20201115
pkgrel=1
pkgdesc="Yorick support for zlib, png, jpeg and mpeg"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/LLNL/yorick-z"
groups=('science' 'yorick-all')
depends=('yorick')
makedepends=('git' 'yorick' 'zlib' 'libpng' 'libjpeg-turbo' 'ffmpeg')
provides=('yorick-z')
conflicts=('yorick-z')
replaces=('yorick-z')

_gitroot="https://github.com/LLNL/yorick-z.git"
_gitname="yorick-z"

build() {
  cd ${srcdir}
  msg "Connecting to git repo..."
  if [ -d ${srcdir}/$_gitname ] ; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
  else
      git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting script install..."

  git clone $_gitname $_gitname-build
  cd ${srcdir}/$_gitname-build

  ./configure
  yorick -batch make.i || return 1
  make
}

package() {
  cd ${srcdir}/$_gitname-build
  make DESTDIR=${pkgdir} install || return 1
}
