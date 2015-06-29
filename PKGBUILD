# Maintainer: Dylan <dylan@hashflo.net>

pkgname=scallion
pkgver=2.0
pkgrel=1
pkgdesc="Creates vanity GPG keys and .onion addresses (for Tor's hidden services) using OpenCL."
arch=('i686' 'x86_64')
url="https://github.com/lachesis/scallion"
license=('MIT')
makedepends=('git' 'mono')
depends=('mono' 'opencl-nvidia')
source=('scallion.sh')
sha256sums=('1090325b7cd46c5b90ac0c9c841ca6ccf15141fd3c7b2f409ebecf0db1d39dff')

_gitroot="git://github.com/lachesis/scallion.git"
_gitname=scallion

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

  xbuild scallion.sln
}

package() {
  install -Dm755 scallion.sh "$pkgdir/usr/bin/$pkgname"
  install -d "$pkgdir/usr/share"
  cp -r "$srcdir/$_gitname-build/$pkgname/bin/Debug" "$pkgdir/usr/share/$pkgname"
}

# vim:set ts=2 sw=2 et:
