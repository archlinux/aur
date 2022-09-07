# Maintainer: Francois Rigaut <frigaut at gmail dot com>

pkgname=yorick-soy-git
pkgver=20201115
pkgrel=1
pkgdesc="Sparse Operations with Yorick"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/frigaut/yorick-soy"
groups=('science' 'yorick-all')
depends=('yorick' 'yorick-yutils-git')
makedepends=('git' 'yorick')
provides=('yorick-soy')
conflicts=('yorick-soy')
replaces=('yorick-soy')

_gitroot="https://github.com/frigaut/yorick-soy.git"
_gitname="yorick-soy"

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

  yorick -batch make.i || return 1
  make || return 1
}

package() {
  cd ${srcdir}/$_gitname-build
  make DESTDIR=${pkgdir} install || return 1
}
