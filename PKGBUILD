# Maintainer: Wiktor Grębla <greblus@gmail.com>
pkgname=emas-git
pkgver=$(date +"%Y%m%d")
pkgrel=1
pkgdesc="EMAS is a modern assembler for MERA 400"
arch=('i686' 'x86_64')
url="https://github.com/jakubfi/emas"
license=('GPL')
depends=('cmake' 'make' 'emelf-git')
makedepends=('git')
conflicts=('emas')

_gitroot='https://github.com/jakubfi/emas.git'
_gitname='emas'

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
  cmake -DCMAKE_INSTALL_PREFIX=/usr . && make all 
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
