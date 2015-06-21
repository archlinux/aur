# Maintainer: Mike Sampson <mike at sambodata dot com>
pkgname=undup-git
pkgver=20120207
pkgrel=1
pkgdesc="compress files by consolidating duplicate data"
arch=('i686' 'x86_64')
url="https://github.com/radii/undup"
license=('GPL')
depends=('openssl')
makedepends=('git')

_gitroot=git://github.com/radii/undup.git
_gitname=undup

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

  # BUILD HERE
  sed -i 's/-lssl/-lssl\ -lcrypto/' Makefile
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  install -D -m755 undup "$pkgdir/usr/bin/undup"
}

# vim:set ts=2 sw=2 et:
