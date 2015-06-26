# Maintainer: Benoit Favre <benoit.favre@gmail.com>
pkgname=setuid-sandbox-git
pkgver=20130211
pkgrel=1
pkgdesc="A suid helper to let a process willingly drop privileges on Linux."
arch=(i686 x86_64)
url="https://code.google.com/p/setuid-sandbox/"
license=('Apache')
depends=(libcap)
makedepends=('git')

_gitroot=https://code.google.com/p/setuid-sandbox/
_gitname=setuid-sandbox

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
  install -d "$pkgdir/bin"
  install sandboxme "$pkgdir/bin"
  chmod +s "$pkgdir/bin/sandboxme"
}

# vim:set ts=2 sw=2 et:
