# Maintainer: nandub <dev@nandub-dev.tk>
pkgname=io-git
pkgver=20110905
pkgrel=1
pkgdesc="Io is a prototype-based programming language inspired by Smalltalk"
arch=('i686', 'x86_64')
url="http://www.iolanguage.com/"
license=('BSD')
depends=('libevent' 'yajl' 'pcre')
makedepends=('git' 'cmake')

_gitroot=https://github.com/stevedekorte/io.git
_gitname=io

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$_gitname-build"
  mkdir -p "$_gitname-build"
  cd "$_gitname-build"

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=release
  make 
}

package() {
  cd "$srcdir/$_gitname/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
