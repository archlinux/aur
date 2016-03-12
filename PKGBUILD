# Maintainer: Wiktor Grębla <greblus@gmail.com>
pkgname=em400-git
pkgver=$(date +"%Y%m%d")
pkgrel=1
pkgdesc="MERA 400 emulator"
arch=('i686' 'x86_64')
url="https://github.com/jakubfi/em400"
license=('GPL')
depends=('cmake' 'make' 'emawp-git' 'emelf-git' 'emdas-git' 'emcrk-git' 'bison' 'flex' 'ncurses' 'readline')
makedepends=('git')
conflicts=('em400')

_gitroot='https://github.com/jakubfi/em400.git'
_gitname='em400'

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

  install -dm 755 "$pkgdir/usr/share/$pkgname/"
  install -m 644 cfg/em400.cfg.template "$pkgdir/usr/share/$pkgname/"
  install -m 644 cfg/mera400.cfg "$pkgdir/usr/share/$pkgname/"
  install -m 644 cfg/mx16.cfg "$pkgdir/usr/share/$pkgname/"
}
# vim:set ts=2 sw=2 et:
