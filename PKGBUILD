# Maintainer: William Termini <aur@termini.me>
pkgname=basiliskii-git
pkgver=r2403.b58a926
pkgrel=1
pkgdesc="an Open Source 68k Macintosh emulator"
arch=('any')
url="http://basilisk.cebix.net/"
license=('GPL')
depends=(sdl gtk2)
makedepends=(git make autoconf)
conflicts=('basiliskii')

pkgver() {
  cd "$srcdir/$_gitname-build"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


_gitroot='https://github.com/cebix/macemu.git'
_gitname='macemu'



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
  cd BasiliskII
  cd src/Unix
  NO_CONFIGURE=1 ./autogen.sh
  ./configure --enable-sdl-video --enable-sdl-audio --disable-vosf --enable-jit-compiler --prefix=/usr
  make
strip BasiliskII
}

package() {
  echo "Making Package"
  cd "$srcdir/$_gitname-build/BasiliskII/src/Unix"
  make DESTDIR="$pkgdir/" install
}

