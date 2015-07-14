# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
pkgname=showtime-git
pkgver=20130206
pkgrel=1
pkgdesc="Media player for use on HTPC media centers."
arch=('i686' 'x86_64')
url="https://www.lonelycoder.com/showtime"
license=('GPL3')
depends=('gtk2' 'libxss' 'libxv' 'libcdio-paranoia' 'libvdpau' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('git' 'mesa' 'yasm')
install=showtime.install

_gitroot=https://github.com/andoma/showtime.git
_gitname=showtime

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

  sed -i -e 's/-Werror//g' -e 's/^\s*CFLAGS\s*=/CFLAGS +=/' Makefile support/*.mk
  sed -i '/gtk-update-icon-cache/d' support/linux.mk

  egrep -lrZ 'cdio/(cdda|paranoia).h' . | xargs -0 sed -i -e 's:cdio/cdda.h:cdio/paranoia/cdda.h:g' -e 's:cdio/cdda.h:cdio/paranoia/paranoia.h:g'

  ./configure --prefix=/usr --release
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" prefix=/usr install
}

# vim:set ts=2 sw=2 et:
