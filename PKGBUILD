# Maintainer: 2ion <dev@2ion.de>
# Former maintainer:  TDY <tdy@archlinux.info>
# Contributor: system <system at tou dot de>
pkgname=ebview-git
pkgver=20130218
pkgrel=1
pkgdesc="A GTK-based EPWING dictionary viewer"
arch=('i686' 'x86_64')
url="http://epview.sourceforge.net"
license=('GPL')
depends=('gtk2' 'eb-library' 'pangox-compat')
makedepends=('git')
conflicts=('ebview')
provides=('ebview')

_gitroot=git://github.com/fujii/ebview.git
_gitname=ebview

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  msg "Starting make..."
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    CFLAGS="-D_FILE_OFFSET_BITS=64" \
    LIBS=-lX11
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install
}

#vim set:ts=2 sw=2 et:
