# Maintainer: Wiktor Grębla <greblus@gmail.com>
pkgname=emdas-git
pkgver=$(date +"%Y%m%d")
pkgrel=1
pkgdesc="Disassembler for MERA 400"
arch=('i686' 'x86_64')
url="https://github.com/jakubfi/emdas"
license=('GPL')
depends=('cmake' 'make' 'emawp-git' 'emelf-git')
makedepends=('git')
conflicts=('emdas')

_gitroot='https://github.com/jakubfi/emdas.git'
_gitname='emdas'

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
  cd "$pkgdir/usr/"
  mv lib64 lib
}

# vim:set ts=2 sw=2 et:
