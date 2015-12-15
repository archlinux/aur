# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Zerial <fernando@zerial.org>

pkgname=waimea-cvs
_pkgname=waimea
pkgver=0.4.0
pkgrel=2
pkgdesc="A fast and highly customizable virtual multiple desktop window manager."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/waimea"
license=('GPL')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('imlib2' 'libxft' 'libxrandr' 'libxinerama' 'perl')
makedepends=('cvs')
source=("$_pkgname.patch")
md5sums=('407ae3ef54cd95f7281545b009d9d036')

_cvsroot=":pserver:anonymous@$_pkgname.cvs.sourceforge.net:/cvsroot/$_pkgname"
_cvsmod="$_pkgname"

prepare() {
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    ( cd $_cvsmod; cvs -z3 update -d )
  else
    cvs -z3 -d $_cvsroot co -f $_cvsmod
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  rm -rf $_cvsmod-build
  cp -r $_cvsmod $_cvsmod-build

  cd $_cvsmod-build
  patch -Np2 -b -z .orig -i ../$_cvsmod.patch
}

build() {
  cd $_cvsmod-build
  autoreconf -fiv
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd $_cvsmod-build
  make prefix="$pkgdir/usr" mandir="$pkgdir/usr/share/man" install
}

