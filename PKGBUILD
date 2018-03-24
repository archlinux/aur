pkgname=lwt-git
_pkgname=lwt
pkgver=2018_02_21
pkgrel=1
pkgdesc="Lightweight terminal emulator based on the VTE and GTK libraries."
url="https://github.com/mewkiz/lwt"
arch=('x86_64' 'i686')
license=('public domain')
depends=('gtk3' 'vte3' 'iniparser')
makedepends=('git')
conflicts=('lwt')
install=${pkgname}.install

_gitroot='https://github.com/mewkiz/lwt.git'
_gitname='lwt'

pkgver() {
  cd ${srcdir}
  git log -1 --format="%cd" --date="format:%Y_%m_%d"
}

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

  #
  # BUILD HERE
  #
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/usr" install
}
